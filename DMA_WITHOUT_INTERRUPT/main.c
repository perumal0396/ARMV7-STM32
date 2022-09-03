/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-UART_DMA              */
/*   DESCRIPTION :                              */
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

void DMA1_SEND(unsigned int src, int len);
void DMA1_SEND2(unsigned int str,unsigned int byte);
void DMA_INIT(void);
char mystr[]="\r\nschool of linux Dharmapuri";
char str[]  ="\r\nARM CORTEX STM32F PROESSOR\r\n";
int main()
{

     int size=strlen(mystr);
     int byte=strlen(str);

     RCC_CONFIG();
     GPIO_CONFIG();

     USART2_INIT();  
     DMA_INIT();
     DMA1_SEND((unsigned int )mystr,size);  
     DMA1_SEND((unsigned int )str,byte);  
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
        
	*USART2_CR3   = *USART2_CR3 &~(1<<3);//half duplex DISABLE       
	
	*USART2_SR  = *USART2_SR &~(1<<6); //clear transmiter completion
}
void DMA_INIT(void)
{
	*DMA1_S6CR   =   *DMA1_S6CR  &~(1<<0); //Stream disable
			
	while((*DMA1_S6CR & 1)); // check for EN bit clear 
	
	*DMA1_S6CR   = 	*DMA1_S6CR &~(0x07<<25);//select channel number in DMA1

	*DMA1_S6CR   =  *DMA1_S6CR |(4<<25);

	*DMA1_S6CR   =  *DMA1_S6CR &~(1<<5);//DMA FLOW  CONTROLLER
	
	*DMA1_S6CR   =  *DMA1_S6CR &~(0x03<<16);//priority level low
	
	*DMA1_S6FCR  =  *DMA1_S6FCR &~(1<<2);//FIFO direct mode enable
	
	*DMA1_S6CR   =  *DMA1_S6CR &~(0x03<<23);//memory burst signal transfer
	
	*DMA1_S6CR   =  *DMA1_S6CR &~(0x03<<21);//pheripherl  burst signal transfer
	
	*DMA1_S6CR   =  *DMA1_S6CR &~(1<<19);//current target memory  

	*DMA1_S6CR   =  *DMA1_S6CR &~(1<<18);//double buffer mode with DMA DISABLE
	
	*DMA1_S6CR   =  *DMA1_S6CR &~(1<<15);//pheripherl increment offset size

	*DMA1_S6CR   =  *DMA1_S6CR &~(0x03<<13);//memory data size 8-bit 	
			
	*DMA1_S6CR   =  *DMA1_S6CR &~(0x03<<11);//pheripherl data size in 8-bit	
	
	*DMA1_S6CR   =  *DMA1_S6CR |(1<<10);//memory increment mode

	*DMA1_S6CR   =  *DMA1_S6CR &~(1<<9);//pheripharl increment mode
	
	*DMA1_S6PAR  =  (unsigned int )USART2_DR; //pheripherl address	
	
	*DMA1_S6CR   =  *DMA1_S6CR &~(1<<8);//circular  mode disable

	*DMA1_S6CR   =  *DMA1_S6CR &~(0x03<<6);//data trasfer direction

	*DMA1_S6CR   =  *DMA1_S6CR |(1<<6);	
}
void DMA1_SEND(unsigned int src,int len)
{
	
	*USART2_SR  = *USART2_SR &~(1<<6); //clear transmiter completion
	
	*DMA1_S6CR   =   *DMA1_S6CR  &~(1<<0); //Stream disable
	
	while((*DMA1_S6CR & 1)); // checking for zero bit clear or not 
		
//	*DMA1_S6PAR  =  (unsigned int )USART2_DR; //pheripherl address	
	
	*DMA1_S6M0AR =  src;//memory address 

	*DMA1_S6NDTR =  len;//byte (or) bit size
	
	*DMA1_S6CR   =  *DMA1_S6CR  |(1<<0); //Stream enable
	
	while(!(*DMA1_HISR & 1<<21));// transmission complete INTERUPT FLAG

	*DMA1_HIFCR  =  (0x3<<20);//clear half transfer and full transfer bit
}

/*void DMA1_SEND2(unsigned int str,unsigned int byte)
{
        *USART2_SR  = *USART2_SR &~(1<<6); //clear transmiter completion

	*DMA1_S6CR   =   *DMA1_S6CR  &~(1<<0); //Stream disable
	
	while((*DMA1_S6CR & 1)); // checking for zero bit set or not 
	
	*DMA1_HISR   =  *DMA1_HISR &~(0x0f<<18);//clear the flag interrupt and stream 
	
	*DMA1_S6M0AR =  str;//memory address 

	*DMA1_S6NDTR =  byte;//byte (or) bit size
			
	*DMA1_S6CR   =  *DMA1_S6CR |(1<<10);//memory increment mode
	
	*DMA1_S6CR   =  *DMA1_S6CR &~(1<<9);//pheripharl increment mode

	*DMA1_S6CR   =  *DMA1_S6CR  |(1<<0); //Stream enable

	while(!(*DMA1_HISR & 3<<21));//TRANSMISSION COMPLETE INTERUPT FLAG
}
*/
