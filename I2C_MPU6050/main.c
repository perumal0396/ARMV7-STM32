/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-i2c with MPU6050      */
/*   DESCRIPTION : temperature and accelametor  */
/************************************************/


#include"main.h"
unsigned char var=0,buffer[100];
int main()
{


	unsigned char tmp[6];
     RCC_CONFIG();
     GPIO_CONFIG();

    usart_init();
	i2c1_init();
	 

	i2c1_write(0xD0,0x6B,&var,1); 
	mpu_init();
    i2c1_read(0xD0,0x75,&var,1);
     	 
	if(var==0x68)
			usart_print("MPU6050 connected....\r\n");
	else
			usart_print("MPU6050 not connected....\r\n");

     while(1){	
         
                   mpu_tmperature();
                   mpu_calculate(); 
					delay();
          
     }
}
void RCC_CONFIG(void)
{
      RCC->AHB1ENR   |= (1<<2); // port c configuration bit
      RCC->AHB1ENR   |= (1<<1); //PORTB CONFIG
      RCC->AHB1ENR   |= (1<<0); //PORTA CONFIG

      RCC->CR	     &=~ (0x00010000); // HSE BIT SET AND CLEAR THE 16-BIT
      RCC->CR        |= (1<<16); //HSE-ON
      while((RCC->CR & 1<<17)==0); //HSE FLAG CHECK ON AND OFF
      
      RCC->CFGR	      &=~ (0x00000003); //SYSTEM CLOCK SWITCH SET AND CLEAR
      RCC->CFGR       |= (1<<0);   // SYSTEM CLOCK SWITCH SET
      while(!(RCC->CFGR & 0x00000004)==4);   // SYSTEM CLOCK SWITCH STATUS
    
      RCC->APB2ENR    |= (1<<17); //TIMER 10 ENABLE
   
      RCC->APB1ENR    |= (1<<17);//USART2 ENABLE
      
      RCC->APB2ENR    |= (1<<4);//USART1 ENABLE

      RCC->AHB1ENR    |= (1<<21);//DMA1 ENABLE
      
      RCC->AHB1ENR    |= (1<<22);//DMA2 ENABLE

      RCC->APB1ENR    |=(1<<21);//I2C1 ENABLE

}
void GPIO_CONFIG(void)
{
       GPIOA->MODER     &=~ (0x0f<<4);
       GPIOA->MODER     |=  (0x0A<<4); //ALTERNATE FUNCTION MODE

       GPIOA->OTYPER    &=~ (0x3<<2);//  PIN8 OUTPUT PUSH-PULL LED 

       GPIOA->PUPDR     &=~ (0x0f<<4);

       GPIOA->AFRL      &=~ (0xf<<8);
       GPIOA->AFRL      |=  (7<<8);//alternate function low

       GPIOA->AFRL      &=~ (0xf<<12);
       GPIOA->AFRL      |=  (7<<12);//alternate function low
 
 //i2C_CONFIG
       GPIOB->MODER    &=~ (0x0f<<12);
       GPIOB->MODER    |=  (0x0A<<12); //ALTERNATE FUNCTION MODE

       GPIOB->OTYPER   |= (0x3<<6);//  ouput open-drain

       GPIOB->PUPDR    &=~ (0x0f<<12);//NO PULL of NO PUSH

       GPIOB->AFRL     &=~ (0xf<<24);
       GPIOB->AFRL     |=  (4<<24);//alternate function low F4

       GPIOB->AFRL     &=~ (0xf<<28);
       GPIOB->AFRL     |=  (4<<28);//alternate function low F4
}

void usart_init(void)
{

	 	USART2->CR1    |= (1<<13);//USART enable
 
     	USART2->BRR    &=~ (0xfff<<4); //BAUDRATE VALUE
         
	 	USART2->BRR    |= (325<<4);
 
	 	USART2->BRR    &=~ (0x0000000f);
 
	 	USART2->BRR    |= 4;
 
        USART2->CR1    |= (1<<15);// over8
 
        USART2->CR1    &=~ (1<<12); //1 Start bit, 8 Data
 
        USART2->CR1    |= (1<<3);//Transmitter enable
 
        USART2->CR3    |= (1<<7);//DMA TRANSMITER ENABLE        
 
        USART2->CR3    &=~ (1<<3);//half duplex DISABLE       

        USART2->SR     &=~ (1<<6); //clear transmiter completion
}

 void i2c1_init(void)
 {
 
        I2C1->CR1   &=~  (1<<15);// Software reset
 
        I2C1->CR1   &=~ (1<<13);// SMBus ALERT

	    I2C1->CR1   &=~ (1<<12);// Packet error checking
 
	    I2C1->CR1   |=  (1<<11);//Acknowledge/PEC Position

        I2C1->CR1   &=~ (1<<7);//clockstretching(slave mode)

        I2C1->CR1   &=~ (1<<6);// General call enable 
 
        I2C1->CR1   &=~ (1<<5);//PEC-disable
 
        I2C1->CR1   &=~ (1<<4);// ARP disable
 
        I2C1->CR1   &=~ (1<<3);//SMBus type

        I2C1->CR1   &=~ (1<<1);//I2C-MODE
 
        I2C1->CR2   |=  (1<<11);//DMA request enable for TxE or RxNE

        I2C1->CR2   &=~ (0x3f<<0);//Peripheral clock frequency 25MHZ
        I2C1->CR2   |=  (25<<0);
 
        I2C1->CCR   =  125;//lock control register Sm mode (Master mode)
 
        I2C1->TRISE =  24;//Maximum rise time in SM 
 
        I2C1->CR1   |=  (1<<0);//pheripheral enable
  }

void i2c1_write(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes )
{   
     volatile unsigned int  tmp,i;
     
     I2C1->CR1  |=(1<<8);//i2c-start condition
     
     while(!(I2C1->SR1 & 1<<0));//Start bit
     tmp = I2C1->SR2;
     
     I2C1->DR  = dev_addr;//device address
          
     while(!(I2C1->SR1 & 0x82));//transmitter data register empty          
     tmp = I2C1->SR2;
     
     I2C1->DR  = reg_addr;//register address
     
     while(!(I2C1->SR1 & (1<<7)));//transmitter data register empty
     tmp = I2C1->SR2;
         
	 for(i=0; i<n_bytes; i++)
    {

			I2C1->DR  = data[i];//data bytes

            while(!(I2C1->SR1 & (1<<7)));//transmitter data register empty
			tmp = I2C1->SR2;
     }
     
     I2C1->CR1   |= (1<<9);//i2c-stop condition
     
}

void i2c1_read(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes )
{
     	volatile unsigned int  tmp,i;
 
     	I2C1->CR1   |= (1<<8);//i2c-start condition
 
     	while(!(I2C1->SR1 & 1<<0));//Start bit
     	tmp = I2C1->SR2;
 
	    I2C1->DR  = dev_addr;//device address with write bit

 	    while(!(I2C1->SR1 & 0x82));//transmitter data register empty          
        tmp = I2C1->SR2;

        I2C1->DR  = reg_addr;//register address
   
        while(!(I2C1->SR1 & (1<<7)));//transmitter data register empty
        tmp = I2C1->SR2;

        I2C1->CR1   |= (1<<8);//i2c-start condition
 
        while(!(I2C1->SR1 & 1<<0));//Start bit
        tmp = I2C1->SR2;
 
 
        I2C1->DR  = dev_addr | 1;//device  address with read bit
 
	    while(!(I2C1->SR1 & 0x82));//addr bit checking    
        tmp = I2C1->SR2;

	    for(i=0; i<n_bytes; i++)
        {
           if(i==n_bytes-1)
       
		 		   I2C1->CR1   &=~  (1<<10);//i2c-not acknowledge
             else
                   I2C1->CR1   |=    (1<<10);//i2c-acknowledge enable bit

           while(!(I2C1->SR1 & (1<<6)));//reciver data register not empty
  			tmp = I2C1->SR2;

            data[i] = I2C1->DR; //data bytes

        }

      I2C1->CR1   |= (1<<9);//i2c-stop condition
}

void mpu_calculate(void)
{

	short int Ax,Ay,Az;
	unsigned short int Axx,Ayy,Azz;	
	
	unsigned char tmp[6];

	short int ACCEL_X,ACCEL_Y,ACCEL_Z;

    i2c1_read(0xD0,0x3B,tmp,6);
	
	ACCEL_X = (short int )(tmp[0]<<8 | tmp[1]);
	
	ACCEL_Y = (short int )(tmp[2]<<8 | tmp[3]);
	
	ACCEL_Z = (short int )(tmp[4]<<8 | tmp[5]);

    Ax = ACCEL_X/16384;
    Ay = ACCEL_Y/16384;
    Az = ACCEL_Z/16384;

    Axx = ((unsigned short int )ACCEL_X % 16384)/1638;
    Ayy = ((unsigned short int )ACCEL_Y % 16384)/1638;
    Azz = ((unsigned short int )ACCEL_Z % 16384)/1638;

	sprintf(buffer,"Ax=%d.%u,Ay=%d.%u,Az=%d.%u\r\n",Ax,Axx,Ay,Ayy,Az,Azz);
 
    usart_print(buffer);

}

void mpu_tmperature(void)
{
	short int temp2;

	unsigned char val[2];

	short int TEMP_1=0,TEMP_2;

	i2c1_read(0xD0,0x41,val,2);

    TEMP_1 = (short int )(val[0]<<8 | val[1]);

    temp2 = TEMP_1/340 + 36;

    sprintf(buffer,"TEMP=%hi deg_C..valu=%hi\r\n",temp2,TEMP_1);

	usart_print(buffer);

}

void mpu_init(void)
{	
    unsigned char data=0;

    i2c1_write(0xD0,0x1C,&data,1);
    
	i2c1_read(0xD0,0x1C,&data,1);
    
	sprintf(buffer,"data=%d\r\n",data);
 
    usart_print(buffer);

}

void usart_tx(unsigned char var)
{


    USART2->SR  &=~ (1<<6); //clear transmiter completion

    while(!(USART2->SR & 1<<7)); // check Transmit data register empty
    USART2->DR = var; // load data into data register

    USART2->DR = var; // load data into data register
    while(!(USART2->SR & 1<<6)); //check Transmission completion

}
unsigned char usart_rx(void)
{

     USART2->CR1 |= (1<<2);// Reciver enable
     
	 while(!(USART2->SR & 1<<5)); //wait for RXNE bit set(waiting for data)
     return  USART2->DR;

}
void usart_print(unsigned char *s)
{
     while(*s)
     {
        usart_tx(*s++);//char priting
	  }
}
void delay(void)
{
	for(int i=0; i<1000000;i++);

}
