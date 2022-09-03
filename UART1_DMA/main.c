/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-UART_DMA              */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/

#include<string.h>

//interrupt
volatile unsigned int (*NVIC_ISER)[8] = (volatile unsigned int (*)[8])0xE000E100;  
volatile unsigned int (*NVIC_ICER)[8] = (volatile unsigned int (*)[8])0xE000E180;
volatile unsigned int (*NVIC_ISPR)[8] = (volatile unsigned int (*)[8])0xE000E200;
volatile unsigned int (*NVIC_ICPR)[8] = (volatile unsigned int (*)[8])0xE000E280;
volatile unsigned int (*NVIC_IABR)[8] = (volatile unsigned int (*)[8])0xE000E300;
volatile unsigned int (*NVIC_IPR)[60] = (volatile unsigned int (*)[60])0xE000E400;
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
	unsigned int CR;	//0x00
	unsigned int PLLCFGR;	//0x04
	unsigned int CFGR;	//0x08
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

	unsigned int MODER;
	unsigned int OTYPER;
	unsigned int OSPEEDR;
	unsigned int PUPDR;
	unsigned int IDR;
	unsigned int ODR;
	unsigned int BSRR;
	unsigned int LCKR;
	unsigned int AFRL;
	unsigned int AFRH;
};
struct GPIO_s *GPIOA = (struct GPIO_s *)0x40020000;
struct GPIO_s *GPIOB = (struct GPIO_s *)0x40020400;



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
void DMA_INIT(void);
void DMA2_SEND(unsigned int src,int len);

char mystr[]="school of\r\n";
char str[]="linux\r\n";
int main()
{

     int size=strlen(mystr);
     int byte=strlen(str);

     RCC_CONFIG();
     GPIO_CONFIG();
     USART1_INIT();

     DMA_INIT();
     DMA2_SEND((unsigned int )mystr,size);
     DMA2_SEND((unsigned int )str,byte);
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
 
       GPIOB->MODER     &=~ (0x0f<<12);//Alternate function mode
       GPIOB->MODER     |=  (0x0A<<12);
       
       GPIOB->AFRL      &=~ (0xf<<24);//alternate function low
       GPIOB->AFRL      |=  (7<<24);

       GPIOB->AFRL      &=~ (0xf<<28);//alternate function low
       GPIOB->AFRL      |=  (7<<28);
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
void DMA_INIT(void)
{  
         DMA2->S[7].CR     &=~ (1<<0); //Stream disable

         while((DMA2->S[7].CR & 1)); // check for EN bit clear 

         DMA2->S[7].CR    &=~ (0x07<<25);//select channel number in DMA1
 
         DMA2->S[7].CR    |=  (4<<25);
 
         DMA2->S[7].CR    &=~ (1<<5);//DMA FLOW  CONTROLLER
 
         DMA2->S[7].CR    &=~ (0x03<<16);//priority level low
 
         DMA2->S[7].FCR   &=~ (1<<2);//FIFO direct mode enable
 
         DMA2->S[7].CR    &=~ (0x03<<23);//memory burst signal transfer
 
         DMA2->S[7].CR    &=~ (0x03<<21);//pheripherl  burst signal transfer
 
         DMA2->S[7].CR    &=~ (1<<19);//current target memory  
 
         DMA2->S[7].CR    &=~ (1<<18);//double buffer mode with DMA DISABLE
 
         DMA2->S[7].CR    &=~ (1<<15);//pheripherl increment offset size

         DMA2->S[7].CR    &=~ (0x03<<13);//memory data size 8-bit        
 
         DMA2->S[7].CR    &=~ (0x03<<11);//pheripherl data size in 8-bit 
 
         DMA2->S[7].CR    |= (1<<10);//memory increment mode
 
         DMA2->S[7].CR    &=~ (1<<9);//pheripharl increment mode
 
         DMA2->S[7].PAR    =  (unsigned int)&USART1->DR; //pheripherl address  
         
	 DMA2->S[7].CR    &=~ (1<<8);//circular  mode disable
 
         DMA2->S[7].CR    &=~ (0x03<<6);//data trasfer direction
 
         DMA2->S[7].CR    |= (1<<6);

}
void DMA2_SEND(unsigned int src,int len)
{
        USART1->SR   &=~ (1<<6); //clear transmiter completion

	DMA2->S[7].CR   &=~ (1<<0);//DMA-DISABLE
	
	while(( DMA2->S[7].CR & 1)); //wait until DMA-DISABLE
	
	DMA2->S[7].M0AR = src; //memory address

	DMA2->S[7].NDTR = len;//byte(or)data register 	

	DMA2->S[7].CR   |= (1<<0);//DMA-stream enable

        while(!(DMA2->HISR & 1<<27));// transmission complete INTERUPT FLAG
 
       DMA2->HIFCR  =  (0x3<<26);//clear half transfer and full transfer bit
}
