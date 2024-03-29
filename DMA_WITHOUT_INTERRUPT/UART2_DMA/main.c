/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-UART_DMA              */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/

#include<string.h>
//make sure all these pointers are assigned with correct address
volatile unsigned int *RCC_CR       = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_PLLCFGR  = (volatile unsigned int *)0x40023804;
volatile unsigned int *RCC_CFGR     = (volatile unsigned int *)0x40023808;
volatile unsigned int *RCC_AHB1ENR  = (volatile unsigned int *)0x40023830;
volatile unsigned int *RCC_APB2ENR  = (volatile unsigned int *)0x40023844;
volatile unsigned int *RCC_APB1ENR  = (volatile unsigned int *)0x40023840;
//portB
volatile unsigned int *GPIOB_MODER  = (volatile unsigned int *)0x40020400;
volatile unsigned int *GPIOB_OTYPER = (volatile unsigned int *)0x40020404;
volatile unsigned int *GPIOB_ODR    = (volatile unsigned int *)0x40020414;
volatile unsigned int *GPIOB_PUPDR  = (volatile unsigned int *)0x4002040C;
volatile unsigned int *GPIOB_AFRL   = (volatile unsigned int *)0x40020420;
volatile unsigned int *GPIOB_AFRH   = (volatile unsigned int *)0x40020424;
//PORTA
volatile unsigned int *GPIOA_MODER  = (volatile unsigned int *)0x40020000;
volatile unsigned int *GPIOA_OTYPER = (volatile unsigned int *)0x40020004;
volatile unsigned int *GPIOA_ODR    = (volatile unsigned int *)0x40020014;
volatile unsigned int *GPIOA_PUPDR  = (volatile unsigned int *)0x4002000C;
volatile unsigned int *GPIOA_AFRL   = (volatile unsigned int *)0x40020020;

//timer10
volatile unsigned int *TIM10_CR1    = (volatile unsigned int *)0x40014400;
volatile unsigned int *TIM10_CNT    = (volatile unsigned int *)0x40014424;
volatile unsigned int *TIM10_PSC    = (volatile unsigned int *)0x40014428;
volatile unsigned int *TIM10_ARR    = (volatile unsigned int *)0x4001442C;
volatile unsigned int *TIM10_SR     = (volatile unsigned int *)0x40014410;
volatile unsigned int *TIM10_EGR    = (volatile unsigned int *)0x40014414;
volatile unsigned int *TIM10_DIER   = (volatile unsigned int *)0x4001440C;
volatile unsigned int *TIM10_CCMR1  = (volatile unsigned int *)0x40014418;
volatile unsigned int *TIM10_CCR1   = (volatile unsigned int *)0x40014434;
volatile unsigned int *TIM10_CCER   = (volatile unsigned int *)0x40014420;

//interrupt
volatile unsigned int (*NVIC_ISER)[8] = (volatile unsigned int (*)[8])0xE000E100;  
volatile unsigned int (*NVIC_ICER)[8] = (volatile unsigned int (*)[8])0xE000E180;
volatile unsigned int (*NVIC_ISPR)[8] = (volatile unsigned int (*)[8])0xE000E200;
volatile unsigned int (*NVIC_ICPR)[8] = (volatile unsigned int (*)[8])0xE000E280;
volatile unsigned int (*NVIC_IABR)[8] = (volatile unsigned int (*)[8])0xE000E300;
volatile unsigned int (*NVIC_IPR)[60] = (volatile unsigned int (*)[60])0xE000E400;

//UART2_MODE
volatile unsigned int *USART2_SR   = (volatile unsigned int *)0x40004400;
volatile unsigned int *USART2_DR   = (volatile unsigned int *)0x40004404;
volatile unsigned int *USART2_BRR  = (volatile unsigned int *)0x40004408;
volatile unsigned int *USART2_CR1  = (volatile unsigned int *)0x4000440C;
volatile unsigned int *USART2_CR2  = (volatile unsigned int *)0x40004410;
volatile unsigned int *USART2_CR3  = (volatile unsigned int *)0x40004414;
volatile unsigned int *USART2_GTPR = (volatile unsigned int *)0x40004418;
//DMA1_REGISTER
volatile unsigned int *DMA1_LISR    = (volatile unsigned int *)0x40026000;
volatile unsigned int *DMA1_HISR    = (volatile unsigned int *)0x40026004;
volatile unsigned int *DMA1_LIFCR   = (volatile unsigned int *)0x40026008;
volatile unsigned int *DMA1_HIFCR   = (volatile unsigned int *)0x4002600C;
volatile unsigned int *DMA1_S6CR    = (volatile unsigned int *)0x400260A0;
volatile unsigned int *DMA1_S6NDTR  = (volatile unsigned int *)0x400260A4;
volatile unsigned int *DMA1_S6PAR   = (volatile unsigned int *)0x400260A8;
volatile unsigned int *DMA1_S6M0AR  = (volatile unsigned int *)0x400260AC;
volatile unsigned int *DMA1_S6M1AR  = (volatile unsigned int *)0x400260B0;
volatile unsigned int *DMA1_S6FCR   = (volatile unsigned int *)0x400260B4;

void RCC_CONFIG(void);
void TIMER10_CONFIG(void);
void GPIO_CONFIG(void);

void USART2_INIT(void);
void USART2_TX(unsigned char var);
unsigned char USART2_RX(void);
void print(char *s);
void delay(void);

void DMA_INIT(unsigned int des,unsigned int src ,int len);
void DMA_send(unsigned int str,int byte);
char mystr[]="school of linux\r\n";
char str[]="ARM CORTEXSTM32 process\r\n";
int main()
{

     RCC_CONFIG();
     GPIO_CONFIG();
     USART2_INIT();
    
     int size=strlen(mystr);

     int byte=strlen(str);

     DMA_INIT((unsigned int)USART2_DR,(unsigned int )mystr,size);
     DMA_send((unsigned int)str,byte);
     while(1){	

     }
}
void RCC_CONFIG(void)
{
      *RCC_AHB1ENR   = *RCC_AHB1ENR |(1<<2); // port c configuration bit
      *RCC_AHB1ENR   = *RCC_AHB1ENR |(1<<1); //PORTB CONFIG
      *RCC_AHB1ENR   = *RCC_AHB1ENR |(1<<0); //PORTA CONFIG

      *RCC_CR	     = *RCC_CR &(~0x00010000); // HSE BIT SET AND CLEAR THE 16-BIT
      *RCC_CR        = *RCC_CR | (1<<16); //HSE-ON
      while((*RCC_CR &  1<<17)==0); //HSE FLAG CHECK ON AND OFF
      
      *RCC_CFGR	     =  *RCC_CFGR & (~0x00000003); //SYSTEM CLOCK SWITCH SET AND CLEAR
      *RCC_CFGR      =  *RCC_CFGR | (1<<0);   // SYSTEM CLOCK SWITCH SET
      while(!(*RCC_CFGR & 0x00000004)==4);   // SYSTEM CLOCK SWITCH STATUS
    
      *RCC_APB2ENR   = *RCC_APB2ENR |(1<<17); //TIMER 10 ENABLE
   
      *RCC_APB1ENR   = *RCC_APB1ENR|(1<<17);//USART2 ENABLE

      *RCC_AHB1ENR   = *RCC_AHB1ENR |(1<<21);//DMA1 ENABLE
}
void GPIO_CONFIG(void)
{
       *GPIOA_MODER    = *GPIOA_MODER &~(0x0f<<4);
       *GPIOA_MODER    = *GPIOA_MODER |(0x0A<<4); //ALTERNATE FUNCTION MODE

       *GPIOA_OTYPER   = *GPIOA_OTYPER &~(1<<2);//  PIN8 OUTPUT PUSH-PULL LED 

       *GPIOA_PUPDR    = *GPIOA_PUPDR &~(0x0f<<4);

       *GPIOA_AFRL     = *GPIOA_AFRL  &~(0xf<<8);
       *GPIOA_AFRL     = *GPIOA_AFRL  |(7<<8);//alternate function low

       *GPIOA_AFRL     = *GPIOA_AFRL  &~(0xf<<12);
       *GPIOA_AFRL     = *GPIOA_AFRL  |(7<<12);//alternate function low
}

void DMA_INIT(unsigned int des,unsigned int src,int len)
{
          
	*DMA1_S6CR   = *DMA1_S6CR &~(1<<0);//DMA-DISABLE
	
	while(( *DMA1_S6CR & 1)); //wait until DMA-DISABLE
	
	*DMA1_HIFCR   = *DMA1_HIFCR &~(0xf<<18); //clear the register
	
	*DMA1_S6PAR  = (unsigned int)USART2_DR; //Peripheral address

	*DMA1_S6M0AR = src; //memory address

        *DMA1_S6NDTR = len;//byte(or)data register 	
	
	*DMA1_S6CR  = *DMA1_S6CR &~(0x7<<25);//select channel4- number
        *DMA1_S6CR  = *DMA1_S6CR |(4<<25);

	*DMA1_S6CR  = *DMA1_S6CR&~(1<<5);//peripheral flow controller is enable

        *DMA1_S6CR  = *DMA1_S6CR &~(0x3<<16); //Priority level low	

	*DMA1_S6CR  = *DMA1_S6CR &~(0x3<<23);//MBURST burst transfer configuration
	
	*DMA1_S6CR  = *DMA1_S6CR &~(0x3<<21);//PBURST burst transfer configuration
	
	*DMA1_S6CR  = *DMA1_S6CR &~(1<<19);//Current target (only in double buffer mode)
	
	*DMA1_S6CR  = *DMA1_S6CR |(1<<18);//double buffer mode)
	
	*DMA1_S6CR  = *DMA1_S6CR |(1<<15);//peripheral size 

	*DMA1_S6FCR = *DMA1_S6FCR &~(1<<2); //Direct mode enabled and fifo is disable

	*DMA1_S6FCR = *DMA1_S6FCR &~(0x3<<11); // Peripheral data size 8-Byte
	
	*DMA1_S6FCR = *DMA1_S6FCR &~(0x3<<13);//Memory data size 8-Byte

	*DMA1_S6CR  = *DMA1_S6CR |(1<<10);//Memory increment mode is enable
	
	*DMA1_S6CR  = *DMA1_S6CR &~(1<<9);//Peripheral increment mode is disable

	*DMA1_S6CR  = *DMA1_S6CR &~(1<<8);//circular  mode is disable

	*DMA1_S6CR  = *DMA1_S6CR &~(0x3<<6);//Memory-to-peripheral
	
	*DMA1_S6CR  = *DMA1_S6CR |(1<<6);//Memory-to-peripheral
	
	*DMA1_S6CR  = *DMA1_S6CR |(1<<0);//DMA-stream enable
	
}
void DMA_send(unsigned int str,int byte)
{

         *DMA1_HIFCR   = *DMA1_HIFCR &~(0xf<<18); //clear the register
	
	 *DMA1_S6PAR  = (unsigned int)USART2_DR; //Peripheral address
 
         *DMA1_S6M0AR = str; //memory address
 
         *DMA1_S6NDTR = byte;//byte(or)data register      
 	
	*DMA1_S6CR  = *DMA1_S6CR |(1<<0);//DMA-stream enable
	

}
void USART2_INIT(void)
{

	*USART2_CR1   = *USART2_CR1 |(1<<13);//USART enable

	*USART2_BRR   = *USART2_BRR &~(0xfff<<4); //BAUDRATE VALUE
	
	*USART2_BRR   = *USART2_BRR |(325<<4); 
	
	*USART2_BRR   = *USART2_BRR &~(0x0000000f);
        
        *USART2_BRR   = *USART2_BRR|4;	

	*USART2_CR1   = *USART2_CR1 |(1<<15);// over8

	*USART2_CR1   = *USART2_CR1 &~(1<<12); //1 Start bit, 8 Data

        *USART2_CR1   = *USART2_CR1 |(1<<3);//Transmitter enable

        *USART2_CR3   = *USART2_CR3 |(1<<7);//DMA TRANSMITER ENABLE
        
}
/*void USART2_TX(unsigned char var)
{
    
  *USART2_SR  = *USART2_SR &~(1<<6); //clear transmiter completion

   while(!(*USART2_SR & 1<<7)); // check Transmit data register empty
   *USART2_DR=var; // load data into data register

   *USART2_DR=var; // load data into data register
   while(!(*USART2_SR & 1<<6)); //check Transmission completion

}
unsigned char USART2_RX(void)
{
	
	*USART2_CR1   = *USART2_CR1 |(1<<2);// Reciver enable
	 while(!(*USART2_SR & 1<<5)); //wait for RXNE bit set(waiting for data)
         return *USART2_DR;

}
void print(char *s)
{
	while(*s)
	{
		USART2_TX(*s++);//char priting
	}
}
void delay()
{

	volatile unsigned int i=0;
	for(i=0;i<1000000;i++);
}
*/
