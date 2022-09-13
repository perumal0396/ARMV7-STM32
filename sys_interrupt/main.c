/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-SYS-TIMER             */
/*   DESCRIPTION : LED-BLINKING with interrupt  */
/************************************************/

volatile unsigned int *RCC_CR       = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_AHB1ENR  = (volatile unsigned int *)0x40023830;
volatile unsigned int *RCC_CFGR     = (volatile unsigned int *)0x40020808;
volatile unsigned int *GPIOC_MODER  = (volatile unsigned int *)0x40020800;
volatile unsigned int *GPIOC_OTYPER = (volatile unsigned int *)0x40020804;
volatile unsigned int *GPIOC_ODR    = (volatile unsigned int *)0x40020814;
volatile unsigned int *STK_CTRL     = (volatile unsigned int *)0xE000E010;
volatile unsigned int *STK_LOAD     = (volatile unsigned int *)0xE000E014;
volatile unsigned int *STK_VAL      = (volatile unsigned int *) 0xE000E018;

void SYS_TIMER(void);
void RCC_CONFIG(void);
void GPIO_CONFIG(void);
void LED_BLINK(void);
void SysTick_Handler(void);

int main()
{
     
     RCC_CONFIG();
     SYS_TIMER();
     GPIO_CONFIG();
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
     while((*RCC_CFGR | 0x00000004)==0);   // SYSTEM CLOCK SWITCH STATUS
   
}
void SYS_TIMER(void)
 {
          *STK_LOAD = 15999999; // TIMER VALUES
          *STK_CTRL = 0;    //CLEAR THE FLAG   
          *STK_CTRL = *STK_CTRL | (1<<2); // CLOCK SOURCE SELECTION //PROCESSOR AHB
          *STK_CTRL = *STK_CTRL | (1<<0); //COUNTER ENABLE START TIMER
	      *STK_CTRL = *STK_CTRL |(1<<1); //TICK INT INTERRUPT ENABLE  
 }
void GPIO_CONFIG(void)
{
       *GPIOC_MODER    = 0x04000000; //GENERAL PURPOSE MODE
       *GPIOC_OTYPER   = 0x00002000;//13 PIN OUTPUT LED
       *GPIOC_ODR      = 0x00002000; //C13 PIN OUTPUT IN LED  
}
void LED_BLINK(void)
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

void SysTick_Handler(void)
{    	
	
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
