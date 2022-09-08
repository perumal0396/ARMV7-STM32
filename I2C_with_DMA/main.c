/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-i2c_with_DMA          */
/*   DESCRIPTION :                              */
/************************************************/


#include "main.h"


unsigned char i2c_tx_buffer[10];
unsigned char i2c_rx_buffer[10];

char mystr[]="\r\nSCHOOL OF LINUX";
char str[]  ="\r\nARM CORTEX STM32F PROESSOR\r\n";
int main()
{
	
	unsigned char var=0,tmp;

	int size=strlen(mystr);
	int byte=strlen(str);

     RCC_CONFIG();
     GPIO_CONFIG();
 //  USART1_INIT();

	 i2c1_init();

     DMA1_TRANSMIT_init();
	 i2c1_write(0xD0,0x6B,&var,1); 
    
	 DMA1_RECIVE_init();
	 i2c1_read(0xD0,0x75,&var,1);

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
       GPIOA->AFRL      |=  (7<<8);//alternate function low Usart2

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
void USART1_INIT(void)
{

	 	USART1->CR1    |= (1<<13);//USART enable
 
     	USART1->BRR    &=~ (0xfff<<4); //BAUDRATE VALUE
         
	 	USART1->BRR    |= (325<<4);
 
	 	USART1->BRR    &=~ (0x0000000f);
 
	 	USART1->BRR    |= 4;
 
        USART1->CR1    |= (1<<15);// over8
 
        USART1->CR1    &=~ (1<<12); //1 Start bit, 8 Data
 
        USART1->CR1    |= (1<<3);//Transmitter enable
 
        USART1->CR3    |= (1<<7);//DMA TRANSMITER ENABLE        
 
        USART1->CR3    &=~ (1<<3);//half duplex DISABLE       

        USART1->SR     &=~ (1<<6); //clear transmiter completion
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
     #define DMA_STREAM_I2C_TX 7

     volatile unsigned int  tmp,i,a;
	 i2c_tx_buffer[0] = reg_addr;
	 n_bytes = n_bytes + 1;

	 for(i=1,a=0; i<n_bytes; i++,a++)	 
	 {
           i2c_tx_buffer[i] = data[a];
	 }

	 DMA1->S[DMA_STREAM_I2C_TX].M0AR = (unsigned int)i2c_tx_buffer; //memory address

	 DMA1->S[DMA_STREAM_I2C_TX].NDTR = n_bytes;//byte(or)data register 	
         
     I2C1->CR1  |=(1<<8);//i2c-start condition
     
     while(!(I2C1->SR1 & 1<<0));//Start bit
     tmp = I2C1->SR2;
     
	 I2C1->DR  = dev_addr;//device address with write bit

 	 while(!(I2C1->SR1 & 0x82));//transmitter data register empty          
     tmp = I2C1->SR2;
     
     DMA1->S[DMA_STREAM_I2C_TX].CR    |= (1<<0); //Stream enable
	 while(!(DMA1->HISR & 1<<27));// transmission complete INTERUPT FLAG
	 DMA1->HIFCR  =  (0x3<<26);//clear half transfer and full transfer bit
     
	 I2C1->CR1   |= (1<<9);//i2c-stop condition
}

void i2c1_read(unsigned char dev_addr,unsigned char reg_addr,unsigned char *data,unsigned char n_bytes )
{
    #define DMA_STREAM_I2C_RX 0

     volatile unsigned int  tmp,i,a;

     I2C1->CR1   |= (1<<8);//i2c-start condition 
     while(!(I2C1->SR1 & 1<<0));//Start bit
     tmp = I2C1->SR2;
	  
	 I2C1->DR  = dev_addr;//device address with write bit
	 
	 while(!(I2C1->SR1 & 0x82));//addr bit checking    
    tmp = I2C1->SR2;
	 
	 I2C1->DR  = reg_addr;//register address with write bit
	 
	 
	 while(!(I2C1->SR1 & 7));//transmited data register empty 
     tmp = I2C1->SR2;
	 
     I2C1->CR1   |= (1<<8);//i2c-start condition 
     while(!(I2C1->SR1 & 1<<0));//Start bit
     tmp = I2C1->SR2;

	 I2C1->DR  = dev_addr | 1;//device address with write bit
	 
	 while(!(I2C1->SR1 & 0x82));//addr bit checking    
	 tmp = I2C1->SR2;

	 DMA1->S[DMA_STREAM_I2C_RX].M0AR = (unsigned int)reg_addr; //memory address

	 DMA1->S[DMA_STREAM_I2C_RX].NDTR =n_bytes;//byte(or)data register 	  
   	 
	 DMA1->S[DMA_STREAM_I2C_RX].CR    | (1<<5);//pheripheral FLOW  CONTROLLER
	 
	 DMA1->S[DMA_STREAM_I2C_RX].CR |= (1<<0); //Stream ensable   

	 while(!(DMA1->LISR & 1<<5));// transmission complete INTERUPT FLAG
     DMA1->LIFCR  =  (0x3<<4);//clear half transfer and full transfer bit

	 I2C1->CR1   |= (1<<9);//i2c-stop condition
}

void DMA1_TRANSMIT_init(void)
{  
  #define DMA_STREAM_I2C_TX 7

         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (1<<0); //Stream disable

         while((DMA1->S[DMA_STREAM_I2C_TX].CR & 1)); // check for EN bit clear 

         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (0x07<<25);//select channel number-1 in DMA1
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    |=  (1<<25);
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (1<<5);//DMA FLOW  CONTROLLER
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (0x03<<16);//priority level low
 
         DMA1->S[DMA_STREAM_I2C_TX].FCR   &=~ (1<<2);//FIFO direct mode enable
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (0x03<<23);//memory burst signal transfer
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (0x03<<21);//pheripherl  burst signal transfer
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (1<<19);//current target memory  
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (1<<18);//double buffer mode with DMA DISABLE
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (1<<15);//pheripherl increment offset size

         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (0x03<<13);//memory data size 8-bit        
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (0x03<<11);//pheripherl data size in 8-bit 
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    |= (1<<10);//memory increment mode
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (1<<9);//pheripharl increment mode
 
         DMA1->S[DMA_STREAM_I2C_TX].PAR   =  (unsigned int)&I2C1->DR; //pheripherl address  
		
	 	 DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (1<<8);//circular  mode disable
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    &=~ (0x03<<6);//data trasfer direction
 
         DMA1->S[DMA_STREAM_I2C_TX].CR    |= (1<<6);
}
 
void DMA1_RECIVE_init(void)
{

		#define DMA1_STREAM_I2C_RX 0

         DMA1->S[DMA_STREAM_I2C_RX].CR     &=~ (1<<0); //Stream disable

         while((DMA1->S[DMA_STREAM_I2C_RX].CR & 1)); // check for EN bit clear 

         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (0x07<<25);//select channel number-1 in DMA1
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    |=  (1<<25);
  
         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (0x03<<16);//priority level low
 
         DMA1->S[DMA_STREAM_I2C_RX].FCR   &=~ (1<<2);//FIFO direct mode enable
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (0x03<<23);//memory burst signal transfer
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (0x03<<21);//pheripherl  burst signal transfer
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (1<<19);//current target memory  
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (1<<18);//double buffer mode with DMA DISABLE
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (1<<15);//pheripherl increment offset size

         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (0x03<<13);//memory data size 8-bit        
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (0x03<<11);//pheripherl data size in 8-bit 
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    |= (1<<10);//memory increment mode
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (1<<9);//pheripharl increment mode
 
         DMA1->S[DMA_STREAM_I2C_RX].PAR    =  (unsigned int)&I2C1->DR; //pheripherl address  
		  
	 	 DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (1<<8);//circular  mode disable
 
         DMA1->S[DMA_STREAM_I2C_RX].CR    &=~ (0x03<<6);//data trasfer direction 

}
