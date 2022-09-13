/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-I2C1 and MPU6050      */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/

#include "main.h"
char mystr[]="school of\r\n";
char str[]="linux\r\n";
unsigned int debg_var[9]={0,0,0,0,0,0,0,0,0};
struct i2c_data_request
{
	unsigned char dev_addr;
	unsigned char reg_addr;
	unsigned char data[10];
	unsigned char n_bytes;
	unsigned char read;
};

struct i2c_data_request i2c_buffer;

unsigned char buffer[100];
int main()
{
	
	unsigned char var=0;
	unsigned int delay;

     int size=strlen(mystr);
     int byte=strlen(str);

     RCC_CONFIG();
     GPIO_CONFIG();

	i2c1_init();
    NVIC_CONFIG();
 	i2c1_write(0xD0,0x6B,&var,1); //device address
	for(delay=0;delay<10000000;delay++);	
    GPIOC->ODR      = 0x00000000; //C13 PIN OUTPUT IN LED 
    i2c1_read(0xD0,0x75,&var,1); //device addresss
    while(1){	

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

       GPIOA->OTYPER    &=~ (1<<2);//  PIN8 OUTPUT PUSH-PULL LED 

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

	   /////////
 	   GPIOC->MODER    = 0x04000000; //GENERAL PURPOSE MODE
       GPIOC->OTYPER   = 0x00002000;//13 PIN OUTPUT LED
       GPIOC->ODR      = 0x00002000; //C13 PIN OUTPUT IN LED 
}

 void i2c1_init(void)
 {
 
        I2C1->CR1   |  (1<<15);// Software reset
        I2C1->CR1   &=~  (1<<15);// Software reset
 
        I2C1->CR1   &=~ (1<<13);// SMBus ALERT

	    I2C1->CR1   &=~ (1<<12);// Packet error checking
 
	    I2C1->CR1   &=~  (1<<11);//Acknowledge/PEC Position

        I2C1->CR1   &=~ (1<<7);//clockstretching(slave mode)

        I2C1->CR1   &=~ (1<<6);// General call enable 
 
        I2C1->CR1   &=~ (1<<5);//PEC-disable
 
        I2C1->CR1   &=~ (1<<4);// ARP disable
 
        I2C1->CR1   &=~ (1<<3);//SMBus type

        I2C1->CR1   &=~ (1<<1);//I2C-MODE
 
        I2C1->CR2   |=  (1<<11);//DMA request enable for TxE or RxNE

        I2C1->CR2   &=~ (0x3f<<0);//Peripheral clock frequency 25MHZ
        I2C1->CR2   |=  (25<<0);
 
        I2C1->CR2   |=  (0x3<<9);//i2c interrupt

        I2C1->CCR   =  125;//lock control register Sm mode (Master mode)
 
        I2C1->TRISE =  24;//Maximum rise time in SM 
 
        I2C1->CR1   |=  (1<<0);//pheripheral enable
  }

void i2c1_write(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes )
{   
     volatile unsigned int  tmp,i;
	
	 i2c_buffer.dev_addr = dev_addr;
	 i2c_buffer.reg_addr = reg_addr;
	 for(i=0; i<n_bytes;i++)
	 {
			 i2c_buffer.data[i] = data[i];
	 }
	 i2c_buffer.n_bytes = n_bytes;
	 i2c_buffer.read = 0;
	 I2C1->CR1  |=(1<<8);//i2c-start condition          
	 *NVIC_ISER[0] = 1<<31;//enabling i2c1 interrupt 
     
}

void i2c1_read(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes )
{
    volatile unsigned int  tmp,i;
		
	i2c_buffer.dev_addr = dev_addr;
	i2c_buffer.reg_addr = reg_addr;
/*	for(i=0; i<n_bytes;i++)
	{

			i2c_buffer.data[i] = data[i];
	}
	*/
	i2c_buffer.n_bytes = n_bytes; 
	i2c_buffer.read = 1;

   	I2C1->CR1   |= (1<<8);//i2c-start condition
	*NVIC_ISER[0] = 1<<31;//enabling i2c1 interrupt 

}

void NVIC_CONFIG(void)
{

	*NVIC_ICPR[0] = 1<<31;//clear the i2c1 interrupt
    *NVIC_ISER[0] = 1<<31;//enabling i2c1 interrupt 
}

void I2C1_EV_IRQHandler(void)
{	
	static unsigned char i=0,first_time=0;
	unsigned int exit=0;
	volatile unsigned int sr1=0,sr2=0;
    *NVIC_ICER[0] = 1<<31;//disabling i2c1 interrupt 
	sr1 = I2C1->SR1;
	sr2 = I2C1->SR2;
	if(sr1 & 1) 
	{	//checking start bit
		debg_var[0]++;
		i=0;
		if(i2c_buffer.read==0)
		{
			I2C1->DR = i2c_buffer.dev_addr;//device address with write
		}
		else if(i2c_buffer.read==1)
		{
			if(first_time==0)
			{
				I2C1->DR = i2c_buffer.dev_addr;//device address with write
				first_time=1;
			}
			else
			{
				I2C1->DR = i2c_buffer.dev_addr | 1; //device address with read
				first_time=0;
				i2c_buffer.read = 2;
			}
		}
	}
	else if(sr1 & 1<<1) //checking ADDR bit
	{
		sr1 = I2C1->SR1;
		sr2 = I2C1->SR2;
		debg_var[1]++;
		if(sr1 & 1<<7)//checking TxE bit
		{	
			//when TxE is 1 and ADDR is also 1,we have to send reg_addr	
			I2C1->DR = i2c_buffer.reg_addr;
		}
	}
	else if(sr1 & 1<<7)//checking TxE bit
	{
		debg_var[2]++;
		if(i2c_buffer.read==1)
		{
	 		I2C1->CR1  |=(1<<8);//i2c-start condition
			debg_var[8]++;
			I2C1->DR = 0;	//<<<<<<check		
		}
		else if(i<i2c_buffer.n_bytes)
		{
			I2C1->DR = i2c_buffer.data[i++];
		}
		else
		{
     		I2C1->CR1   |= (1<<9);//i2c-stop condition	
			I2C1->DR = 0;
			debg_var[3]++;
		//	exit = 1;
		}
	}
		//debg_var[4]++;
	else if(sr1 & 1<<6)//checking RxNE bit
	{
		debg_var[4]++;
		if(i<i2c_buffer.n_bytes)
		{
			i2c_buffer.data[i++] = I2C1->DR;
			if(i>i2c_buffer.n_bytes-1)
			{
				I2C1->CR1 &= ~(1<<10);//i2c-not acknowledge
     			I2C1->CR1   |= (1<<9);//i2c-stop condition	
				debg_var[6]++;
		//		exit = 1;
			}
			else
			{
				debg_var[7]++;
				I2C1->CR1 |= (1<<10);//i2c-acknowledge
			}
		}

	}
	else
	{
		while(1);
	}
	debg_var[5]++;
	*NVIC_ICPR[0] = 1<<31;//clear the i2c1 interrupt
/*	if(exit == 1)
	{
    	*NVIC_ICER[0] = 1<<31;//disabling i2c1 interrupt 
	}
	else
	{ 
    	*NVIC_ISER[0] = 1<<31;//enabling i2c1 interrupt 
	}
*/	
    	*NVIC_ISER[0] = 1<<31;//enabling i2c1 interrupt 
}

