/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-TIMER10               */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/

//make sure all these pointers are assigned with correct address
volatile unsigned int *RCC_CR       = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_PLLCFGR  = (volatile unsigned int *)0x40023804;
volatile unsigned int *RCC_CFGR     = (volatile unsigned int *)0x40023808;
volatile unsigned int *RCC_AHB1ENR  = (volatile unsigned int *)0x40023830;
volatile unsigned int *RCC_APB2ENR  = (volatile unsigned int *)0x40023844;
volatile unsigned int *RCC_AHB1LPENR= (volatile unsigned int *)0x40023850;
volatile unsigned int *RCC_AHB1RSTR = (volatile unsigned int *)0x40023810;
//port C
volatile unsigned int *GPIOC_MODER  = (volatile unsigned int *)0x40020800;
volatile unsigned int *GPIOC_OTYPER = (volatile unsigned int *)0x40020804;
volatile unsigned int *GPIOC_ODR    = (volatile unsigned int *)0x40020814;
volatile unsigned int *GPIOC_IDR    = (volatile unsigned int *)0x40020810;
volatile unsigned int *GPIOC_OSPEEDR= (volatile unsigned int *)0x40020808;
volatile unsigned int *GPIOC_PUPDR  = (volatile unsigned int *)0x4002080C;
//PORTB
volatile unsigned int *GPIOB_MODER  = (volatile unsigned int *)0x40020400;
volatile unsigned int *GPIOB_OTYPER = (volatile unsigned int *)0x40020404;
volatile unsigned int *GPIOB_ODR    = (volatile unsigned int *)0x40020414;
volatile unsigned int *GPIOB_PUPDR  = (volatile unsigned int *)0x4002040C;

//sys_tick
volatile unsigned int *STK_CTRL     = (volatile unsigned int *)0xE000E010;
volatile unsigned int *STK_LOAD     = (volatile unsigned int *)0xE000E014;
volatile unsigned int *STK_VAL      = (volatile unsigned int *)0xE000E018;
//timer
volatile unsigned int *TIM10_CR1    = (volatile unsigned int *)0x40014400;
volatile unsigned int *TIM10_CNT    = (volatile unsigned int *)0x40014424;
volatile unsigned int *TIM10_PSC    = (volatile unsigned int *)0x40014428;
volatile unsigned int *TIM10_ARR    = (volatile unsigned int *)0x4001442C;
volatile unsigned int *TIM10_SR     = (volatile unsigned int *)0x40014410;
volatile unsigned int *TIM10_EGR    = (volatile unsigned int *)0x40014414;
volatile unsigned int *TIM10_DIER   = (volatile unsigned int *)0x4001440C;

//interrupt
volatile unsigned int (*NVIC_ISER)[8] = (volatile unsigned int (*)[8])0xE000E100;
volatile unsigned int (*NVIC_ICER)[8] = (volatile unsigned int (*)[8])0xE000E180;
volatile unsigned int (*NVIC_ISPR)[8] = (volatile unsigned int (*)[8])0xE000E200;
volatile unsigned int (*NVIC_ICPR)[8] = (volatile unsigned int (*)[8])0xE000E280;
volatile unsigned int (*NVIC_IABR)[8] = (volatile unsigned int (*)[8])0xE000E300;
volatile unsigned int (*NVIC_IPR )[8] = (volatile unsigned int (*)[8])0xE000E400;
volatile unsigned int (*NVIC_STIR)[60]= (volatile unsigned int (*)[60])0xE000EE00;

void RCC_CONFIG(void);
void SYS_CONFIG(void);
void TIMER10_CONFIG(void);
void sys_led(void);

//void NVIC_CONFIG(void);
void GPIO_CONFIG(void);
void TMR_LED(void);
//void TIM1_UP_TIM10_IRQHandler(void);
int main()
{
     
     RCC_CONFIG();
     SYS_CONFIG();
     TIMER10_CONFIG();  
     GPIO_CONFIG();
     while(1)
     {    
     TMR_LED();
      sys_led();
     }
}

void RCC_CONFIG(void)
{ 
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<2); // port c configuration bit
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<1); // PORTB configuration bit

  //    *RCC_AHB1LPENR  = *RCC_AHB1LPENR &~(1<<2); // port c configuration bit
  //    *RCC_AHB1LPENR  = *RCC_AHB1LPENR |(1<<2); // port c configuration bit
      
  //    *RCC_AHB1LPENR  = *RCC_AHB1LPENR &~(1<<1); //PORTB configuration bit
   //   *RCC_AHB1LPENR  = *RCC_AHB1LPENR |(1<<1); // PORTB configuration bit

      *RCC_CR	      = *RCC_CR &(~0x00010000); // HSE BIT SET AND CLEAR THE 16-BIT
      *RCC_CR         = *RCC_CR | (1<<16); //HSE-ON
      while((*RCC_CR &  1<<17)==0); //HSE FLAG CHECK ON AND OFF
      
      *RCC_CFGR	     =  *RCC_CFGR & (~0x00000003); //SYSTEM CLOCK SWITCH SET AND CLEAR
      *RCC_CFGR      =  *RCC_CFGR | (1<<0);   // SYSTEM CLOCK SWITCH SET
     while(!(*RCC_CFGR & 0x00000004)==4);   // SYSTEM CLOCK SWITCH STATUS
      *RCC_APB2ENR   = *RCC_APB2ENR |(1<<17); //TIMER 10 ENABLE

}
void SYS_CONFIG(void)
{  
          *STK_LOAD = 2500000-1;
    //    *STK_LOAD = 16777215;//24-bit only enable the systick timer 0x00ffffff
	  *STK_VAL  = 0;
          *STK_CTRL = 0;    //CLEAR THE FLAG
          *STK_CTRL = *STK_CTRL | (1<<2); // CLOCK SOURCE SELECTION //PROCESSOR AH
          *STK_CTRL = *STK_CTRL | (1<<0); //COUNTER ENABLE START TIMER
}
void TIMER10_CONFIG()
{              
	// auto-reload enable
	 *TIM10_CR1 = *TIM10_CR1 |(1<<7);
		
	//one plus mode disable
	*TIM10_CR1 = *TIM10_CR1 &~(0<<3);

	//URS-update request source in zero
	*TIM10_CR1 = *TIM10_CR1 &~(0<<2);

	//UDIS update disaple 
	*TIM10_CR1 = *TIM10_CR1 &~(0<<1);

	//Interrupt enable register
	*TIM10_DIER = *TIM10_DIER &~(1<<0);

	//status register 
	*TIM10_SR = *TIM10_SR &~(1<<0);
               
       	//Update generation
	*TIM10_EGR = *TIM10_EGR |(1<<0);

	//counter values
	 *TIM10_CNT = 0;
       // prescaler values
	*TIM10_PSC =1000;
	
	//auto-reload register
	*TIM10_ARR = 32700;

       //counter enable
	*TIM10_CR1 = *TIM10_CR1 |(1<<0);
}

void GPIO_CONFIG(void)
{
       *GPIOC_MODER    = 0x04000000;//INPUT PORTC
       *GPIOB_MODER    = *GPIOB_MODER |(1<<0); //INPUT PORTB0

       *GPIOC_OTYPER   = 0x00002000; //13 PIN OUTPUT LED
       *GPIOB_OTYPER   = *GPIOB_OTYPER |(1<<0); //PORTB0 OUTPUT
     

       *GPIOC_ODR      = 0x00002000; //C13 PIN OUTPUT IN LED  
       *GPIOB_ODR      = *GPIOB_ODR |(1<<0);//PORTB

//       *GPIOC_PUPDR    = *GPIOC_PUPDR |(1<<26); //pull-up
//       *GPIOB_PUPDR    = *GPIOB_PUPDR |(1<<0); //pull-up
}
void TMR_LED(void)
{    	
 	
        while(!(*TIM10_SR  & (1<<0))); //check the flag set
       *TIM10_SR = *TIM10_SR & (~(1<<0));	

	 if(*GPIOB_ODR & 0x00000001)
  	 {

		*GPIOB_ODR  = *GPIOB_ODR &(~0x00000001); // LED ON
  	 }
	 else
 	 {
        	*GPIOB_ODR  = *GPIOB_ODR |(0x00000001); // LED OFF
  
 	 }
}
void sys_led(void)
{

      while((*STK_CTRL & (1<<16))==0); // WAIT FOR THE TIMER FLAGE SET 1 OR 0
      *STK_CTRL= *STK_CTRL & (~(1<<16)); //CLEAR FLAGE SET

	 if(*GPIOC_ODR & 0x00002000)
  	 {

		*GPIOC_ODR  = *GPIOC_ODR &(~0x00002000); // LED ON
  	 }
	 else
 	 {
        	*GPIOC_ODR  = *GPIOC_ODR |(0x00002000); // LED OFF

 	 }
}
