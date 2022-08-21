/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-PWM-MODE              */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/


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


void RCC_CONFIG(void);
void TIMER10_CONFIG(void);
void GPIO_CONFIG(void);

void USART2_INIT(void);
void USART2_TX(unsigned char var);
unsigned char USART2_RX(void);
void print(char *s);
void delay(void);

int main()
{
  unsigned int i;
     RCC_CONFIG();
     GPIO_CONFIG();
     USART2_INIT();

	     print("USART_PRITING\n\r");
     while(1)
     {
	   i=USART2_RX();
	  USART2_TX(i); 
    }
}
void RCC_CONFIG(void)
{
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<2); // port c configuration bit
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<1); //PORTB CONFIG
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<0); //PORTA CONFIG

      *RCC_CR	      = *RCC_CR &(~0x00010000); // HSE BIT SET AND CLEAR THE 16-BIT
      *RCC_CR         = *RCC_CR | (1<<16); //HSE-ON
      while((*RCC_CR &  1<<17)==0); //HSE FLAG CHECK ON AND OFF
      
      *RCC_CFGR	     =  *RCC_CFGR & (~0x00000003); //SYSTEM CLOCK SWITCH SET AND CLEAR
      *RCC_CFGR      =  *RCC_CFGR | (1<<0);   // SYSTEM CLOCK SWITCH SET
      while(!(*RCC_CFGR & 0x00000004)==4);   // SYSTEM CLOCK SWITCH STATUS
    
      *RCC_APB2ENR   = *RCC_APB2ENR |(1<<17); //TIMER 10 ENABLE
   
      *RCC_APB1ENR   = *RCC_APB1ENR|(1<<17);//USART2 ENABLE
}
void GPIO_CONFIG(void)
{
       *GPIOA_MODER    = *GPIOA_MODER &~(0x0f<<4);
       *GPIOA_MODER    = *GPIOA_MODER |(0x0A<<4); //ALTERNATE FUNCTION MODE

       *GPIOA_OTYPER   = *GPIOA_OTYPER &~(0<<2);//  PIN8 OUTPUT PUSH-PULL LED 

       *GPIOA_PUPDR  = *GPIOA_PUPDR &~(0x0f<<4);

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
}
void USART2_TX(unsigned char var)
{
  
   
  *USART2_SR  = *USART2_SR &~(1<<6); //clear transmiter completion

   while(!(*USART2_SR & 1<<7)); // check Transmit data register empty
   *USART2_DR=var; // load data into data register

   *USART2_DR=var; // load data into data register
   while(!(*USART2_SR & 1<<6)); //check Transmission completion

//   while(!(*USART2_SR & 1<<5));
 //  var=*USART2_DR;

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
	for(i=0;i<1000000;i++);  //dealy for 1s
}
