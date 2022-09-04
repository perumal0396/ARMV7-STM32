/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-I2C1 and MPU6050      */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/

#include<string.h>

struct USART_s
{
	unsigned int SR;	//0x00
	unsigned int DR;	//0x04
	unsigned int BRR;	//0x08	
	unsigned int CR1;	//0x0C
	unsigned int CR2;	//0x10
	unsigned int CR3;	//0x14
	unsigned int GTPR;	//0x18
};
struct USART_s *USART1 = (struct USART_s *)0x40011000;

struct RCC_s
{
	unsigned int CR; 	   //0x00
	unsigned int PLLCFGR;  //0x04
	unsigned int CFGR;	   //0x08
	unsigned int CIR;
	unsigned int AHB1RSTR;
	unsigned int AHB2RSTR;
	unsigned int reserved1;
	unsigned int reserved2;
	unsigned int APB1RSTR;
	unsigned int APB2RSTR;
	unsigned int reserved3;
	unsigned int reserved4;
	unsigned int AHB1ENR;
	unsigned int AHB2ENR;
	unsigned int reserved5;
	unsigned int reserved6;
	unsigned int APB1ENR;
	unsigned int APB2ENR;
	unsigned int reserved7;
	unsigned int reserved8;
	unsigned int AHB1LPENR;
	unsigned int AHB2LPENR;
	unsigned int reserved9;
	unsigned int reserved10;
	unsigned int APB1LPENR;
	unsigned int APB2LPENR;
	unsigned int reserved11;
	unsigned int reserved12;
	unsigned int BDCR;
	unsigned int CSR;
	unsigned int reserved13;
	unsigned int reserved14;
	unsigned int SSCGR;
	unsigned int PLLI2SCFGR;
	unsigned int DCKCFGR;
};
struct RCC_s *RCC = (struct RCC_s *)0x40023800;

struct GPIO_s
{

	unsigned int MODER;  //0x00
	unsigned int OTYPER; //0x04 
	unsigned int OSPEEDR;//0x08
	unsigned int PUPDR;  //0x0c
	unsigned int IDR;    //0x20
	unsigned int ODR;    //0x14
	unsigned int BSRR;   
	unsigned int LCKR;
	unsigned int AFRL;   //0x20
	unsigned int AFRH;   //0x24
};
struct GPIO_s *GPIOA = (struct GPIO_s *)0x40020000;
struct GPIO_s *GPIOB = (struct GPIO_s *)0x40020400;


struct I2C_s
{
	unsigned int CR1;  //0x00
	unsigned int CR2;  //0x04
	unsigned int OAR1; //0x08
	unsigned int OAR2; //0x0c
	unsigned int DR;   //0x10
	unsigned int SR1;  //0x14
	unsigned int SR2;  //0x18
	unsigned int CCR;  //0x1c
	unsigned int TRISE;//0x20
	unsigned int FLTR; //0x24
};

struct I2C_s *I2C1 = (struct I2C_s *)0x40005400;

struct DMA_STREAM_s
{

	unsigned int CR;
	unsigned int NDTR;
	unsigned int PAR;
	unsigned int M0AR;
	unsigned int M1AR;
	unsigned int FCR;

};

struct DMA_s
{

	unsigned int LISR;
	unsigned int HISR;
	unsigned int LIFCR;
	unsigned int HIFCR;
	struct DMA_STREAM_s S[8];
};
struct DMA_s *DMA2 = (struct DMA_s *)0x40026400;



void RCC_CONFIG(void);
void GPIO_CONFIG(void);

void USART1_INIT(void);


//I2C_FUNCTION
void i2c1_init(void);
void i2c1_write(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes );
void i2c1_read(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes );

void DMA_INIT(void);
void DMA2_SEND(unsigned int src,int len);

char mystr[]="school of\r\n";
char str[]="linux\r\n";
int main()
{
	
	unsigned char var=0;

     int size=strlen(mystr);
     int byte=strlen(str);

     RCC_CONFIG();
     GPIO_CONFIG();

	 i2c1_init();

	 i2c1_write(0xD0,0x6B,&var,1); //device address
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
          
     while(!(I2C1->SR1 & 0x82));//checking ADDR and TxNE bit            
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

 	    while(!(I2C1->SR1 & 0x82));//checking ADDR and TxNE bit          
        tmp = I2C1->SR2;

        I2C1->DR  = reg_addr;//register address
   
        while(!(I2C1->SR1 & (1<<7)));//transmitter data register empty
        tmp = I2C1->SR2;

        I2C1->CR1   |= (1<<8);//i2c-start condition
 
        while(!(I2C1->SR1 & 1<<0));//Start bit
        tmp = I2C1->SR2;
 
 
        I2C1->DR  = dev_addr | 1;//device  address with read bit
 
	    while(!(I2C1->SR1 & 0x82));//checking ADDR and TxNE bit  
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

