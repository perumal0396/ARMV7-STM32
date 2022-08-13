/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-SYS-TIMER             */
/*   DESCRIPTION : LED-BLINKING with interrupt  */
/************************************************/



//make sure all these pointers are assigned with correct address
volatile unsigned int *RCC_CR       = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_PLLCFGR  = (volatile unsigned int *)0x40023804;
volatile unsigned int *RCC_CFGR     = (volatile unsigned int *)0x40023808;
volatile unsigned int *RCC_AHB1ENR  = (volatile unsigned int *)0x40023830;
volatile unsigned int *RCC_APB2ENR  = (volatile unsigned int *)0x40023844;
//port
volatile unsigned int *GPIOC_MODER  = (volatile unsigned int *)0x40020800;
volatile unsigned int *GPIOC_OTYPER = (volatile unsigned int *)0x40020804;
volatile unsigned int *GPIOC_ODR    = (volatile unsigned int *)0x40020814;
//sys_tick
volatile unsigned int *STK_CTRL     = (volatile unsigned int *)0xE000E010;
volatile unsigned int *STK_LOAD     = (volatile unsigned int *)0xE000E014;
volatile unsigned int *STK_VAL      = (volatile unsigned int *)0xE000E018;
//timer
volatile unsigned int *TIM9_CR1    = (volatile unsigned int *)0x40014000;
volatile unsigned int *TIM9_CNT    = (volatile unsigned int *)0x40014024;
volatile unsigned int *TIM9_PSC    = (volatile unsigned int *)0x40014028;
volatile unsigned int *TIM9_ARR    = (volatile unsigned int *)0x4001402C;
volatile unsigned int *TIM9_SR     = (volatile unsigned int *)0x40014010;
volatile unsigned int *TIM9_EGR    = (volatile unsigned int *)0x40014014;
volatile unsigned int *TIM9_DIER   = (volatile unsigned int *)0x4001400C;
//interrupt
volatile unsigned int (*NVIC_ISER)[8] = (volatile unsigned int (*)[8])0xE000E100;  
volatile unsigned int (*NVIC_ICER)[8] = (volatile unsigned int (*)[8])0xE000E180;
volatile unsigned int (*NVIC_ISPR)[8] = (volatile unsigned int (*)[8])0xE000E200;
volatile unsigned int (*NVIC_ICPR)[8] = (volatile unsigned int (*)[8])0xE000E280;
volatile unsigned int (*NVIC_IABR)[8] = (volatile unsigned int (*)[8])0xE000E300;
volatile unsigned int (*NVIC_IPR)[60] = (volatile unsigned int (*)[60])0xE000E400;


void TIM1_BRK_TIM9_IRQHandler(void); 
void RCC_CONFIG(void);
void TIMER9_CONFIG(void);
void NVIC_CONFIG(void);
void GPIO_CONFIG(void);
void LED_BLINK(void);

int main()
{
     RCC_CONFIG();
     TIMER9_CONFIG();
     GPIO_CONFIG();
     NVIC_CONFIG();
     while(1)
     {    
 //   	LED_BLINK(); 
     }
}

void RCC_CONFIG(void)
{
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<2); // port c configuration bit
      *RCC_CR	      = *RCC_CR &(~0x00010000); // HSE BIT SET AND CLEAR THE 16-BIT
      *RCC_CR         = *RCC_CR | (1<<16); //HSE-ON
      while((*RCC_CR &  1<<17)==0); //HSE FLAG CHECK ON AND OFF
      
      *RCC_CFGR	     =  *RCC_CFGR & (~0x00000003); //SYSTEM CLOCK SWITCH SET AND CLEAR
      *RCC_CFGR      =  *RCC_CFGR | (1<<0);   // SYSTEM CLOCK SWITCH SET
     while(!(*RCC_CFGR & 0x00000004)==4);   // SYSTEM CLOCK SWITCH STATUS
    
      *RCC_APB2ENR   = *RCC_APB2ENR |(1<<16); //TIMER9 ENABLE

}
void TIMER9_CONFIG(void)
{      
        *TIM9_CR1 = *TIM9_CR1 |(1<<7); //auto-reload enable
  
        *TIM9_CR1 = *TIM9_CR1 &~(0<<3); //one plus mode disable

        *TIM9_CR1 = *TIM9_CR1 &~(0<<2); //URS-update request source in zero

        *TIM9_CR1 = *TIM9_CR1 &~(0<<1); //UDIS update disable
 
        *TIM9_DIER = *TIM9_DIER |(1<<0); //interrupt enable register
  
        *TIM9_SR = *TIM9_SR &~(1<<0); //status register
  
        *TIM9_EGR = *TIM9_EGR |(1<<0); //update generation
 
        *TIM9_CNT = 100; //counter values

	*TIM9_PSC = 1000; //prescaler values

        *TIM9_ARR = 2500; //auto-reload register
 
        *TIM9_CR1 = *TIM9_CR1 |(1<<0); //counter enable

}
  void NVIC_CONFIG(void)
  {
 
       //clear the interrupt for position 24 bit
        (*NVIC_ICPR)[0] = (*NVIC_ICPR)[0] |(1<<24);

      //enable interrupt for position 24 (timer9)
	(*NVIC_ISER)[0] = (*NVIC_ISER)[0] |(1<<24);
  }

void GPIO_CONFIG(void)
{
       *GPIOC_MODER    = 0x04000000; //GENERAL PURPOSE MODE
       *GPIOC_OTYPER   = 0x00002000;//13 PIN OUTPUT LED
       *GPIOC_ODR      = 0x00002000; //C13 PIN OUTPUT IN LED  
}
void LED_BLINK(void)
{    	
   // static unsigned int temp=0;

        while(!(*TIM9_SR  & (1<<0))); //check the flag set
        *TIM9_SR = *TIM9_SR & (~(1<<0));	

	 if(*GPIOC_ODR & 0x00002000)
  	 {

		*GPIOC_ODR  = *GPIOC_ODR &(~0x00002000); // LED ON
  	 }
	 else
 	 {
 
	 	 *GPIOC_ODR  = *GPIOC_ODR |(0x00002000); // LED OFF
   	 }

   //   temp++;
   //   if(temp==10)
  //   {
          //enable one pulse mode
  //       *TIM9_CR1 = *TIM9_CR1 |(1<<3);
   //  }
}  
void TIM1_BRK_TIM9_IRQHandler(void)
{
     
	*TIM9_SR = *TIM9_SR & (~(1<<0));
          if(*GPIOC_ODR & 0x00002000)
         {
                 *GPIOC_ODR  = *GPIOC_ODR &(~0x00002000); // LED ON
 
          }
          else
          {
                 *GPIOC_ODR  = *GPIOC_ODR |(0x00002000); // LED OFF
 
          }
}
