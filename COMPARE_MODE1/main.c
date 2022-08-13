/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-COMPARE-MODE          */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/

//make sure all these pointers are assigned with correct address
volatile unsigned int *RCC_CR       = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_PLLCFGR  = (volatile unsigned int *)0x40023804;
volatile unsigned int *RCC_CFGR     = (volatile unsigned int *)0x40023808;
volatile unsigned int *RCC_AHB1ENR  = (volatile unsigned int *)0x40023830;
volatile unsigned int *RCC_APB2ENR  = (volatile unsigned int *)0x40023844;

//portB
volatile unsigned int *GPIOB_MODER  = (volatile unsigned int *)0x40020400;
volatile unsigned int *GPIOB_OTYPER = (volatile unsigned int *)0x40020404;
volatile unsigned int *GPIOB_ODR    = (volatile unsigned int *)0x40020414;
volatile unsigned int *GPIOB_PUPDR  = (volatile unsigned int *)0x4002040C;
volatile unsigned int *GPIOB_AFRL   = (volatile unsigned int *)0x40020420;
volatile unsigned int *GPIOB_AFRH   = (volatile unsigned int *)0x40020424;

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

void RCC_CONFIG(void);
void TIMER10_CONFIG(void);
void GPIO_CONFIG(void);
void TIMER10_LED(void);
void delay(void);
int main()
{
  unsigned int i;
     RCC_CONFIG();
     TIMER10_CONFIG();
     GPIO_CONFIG();
     while(1)
     {    
/*   	 for(i=25;i<=50;i++)
    	 {	    
         	*TIM10_CCR1 =  i; //1-millisecond capture/compare register ON
  	  	delay();
         }
    	 for(i=50;i>=25;i--)
         {		
    	   	*TIM10_CCR1 =  i; //1-millisecond capture/compare register ON
  	       	delay();
	}
  */

	while(!(*TIM10_SR & 2));	     


	*TIM10_CCMR1 = *TIM10_CCMR1 &~(0x00000070); //inactive mode SET CHANNEL
        *TIM10_CCMR1 = *TIM10_CCMR1|(0x02<<4);

        *TIM10_CCR1 =  100; //1-millisecond capture/compare register ON

	while(!(*TIM10_SR & 2));	     

	*TIM10_CCMR1 = *TIM10_CCMR1 &~(0x00000070); //active mode SET CHANNEL
        *TIM10_CCMR1 = *TIM10_CCMR1|(0x01<<4);

        *TIM10_CCR1 =  25; //1-millisecond capture/compare register ON

    }
}
void RCC_CONFIG(void)
{
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<2); // port c configuration bit
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<1); //PORTB CONFIG
      *RCC_CR	      = *RCC_CR &(~0x00010000); // HSE BIT SET AND CLEAR THE 16-BIT
      *RCC_CR         = *RCC_CR | (1<<16); //HSE-ON
      while((*RCC_CR &  1<<17)==0); //HSE FLAG CHECK ON AND OFF
      
      *RCC_CFGR	     =  *RCC_CFGR & (~0x00000003); //SYSTEM CLOCK SWITCH SET AND CLEAR
      *RCC_CFGR      =  *RCC_CFGR | (1<<0);   // SYSTEM CLOCK SWITCH SET
      while(!(*RCC_CFGR & 0x00000004)==4);   // SYSTEM CLOCK SWITCH STATUS
    
      *RCC_APB2ENR   = *RCC_APB2ENR |(1<<17); //TIMER 10 ENABLE
}
void TIMER10_CONFIG(void)
{              
	              	 
	*TIM10_CR1 = *TIM10_CR1 |(1<<7); //auto-reload enable
		
	*TIM10_CR1 = *TIM10_CR1 &~(0<<3); //one plus mode disable

	*TIM10_CR1 = *TIM10_CR1 &~(0<<2); //URS-update request source in zero

	*TIM10_CR1 = *TIM10_CR1 &~(0<<1); //UDIS update disable
	
	*TIM10_SR = *TIM10_SR &~(1<<0); //status register
               
	*TIM10_EGR = *TIM10_EGR |(1<<0); //update generation

	*TIM10_CCMR1 = *TIM10_CCMR1 &~(0x00000070); //SET CHANNEL

        *TIM10_CCMR1 = *TIM10_CCMR1|(0x01<<4);

	*TIM10_CCMR1 = *TIM10_CCMR1 &~(0x00000008);//Output compare 1 preload enable
      
        *TIM10_CCMR1 = *TIM10_CCMR1 &~(0x00000003);//CC1 channel is configured as output.	

	*TIM10_CNT = 0; //counter value

	*TIM10_PSC = 1000; //prescaler values

	*TIM10_ARR = 1000; //auto-reload register
      
//        *TIM10_CCMR1 = *TIM10_CCMR1 &~(0x7<<4); //pwm mode1

 //       *TIM10_CCMR1 = *TIM10_CCMR1 |(6<<4); // 5,6,pwm mode1

        *TIM10_CCER = *TIM10_CCER |(1<<0); //ENABLE SIGNAL PWM	

        *TIM10_CCR1 =  25; //1-millisecond capture/compare register ON
	              	 	              	 
	*TIM10_CR1 = *TIM10_CR1 |(1<<0); //counter enable
}
void GPIO_CONFIG(void)
{
       *GPIOB_MODER    = *GPIOB_MODER &~(1<<17);
       *GPIOB_MODER    = *GPIOB_MODER |(1<<17); //ALTERNATE FUNCTION MODE

       *GPIOB_OTYPER   = *GPIOB_OTYPER &~(0<<8);//  PIN8 OUTPUT PUSH-PULL LED
       *GPIOB_ODR      = *GPIOB_ODR   |(1<<8); //B8 PIN OUTPUT IN LED  

       *GPIOB_PUPDR  = *GPIOB_PUPDR |(1<<17);

       *GPIOB_AFRH     = *GPIOB_AFRH  &(~0x00000003);
       *GPIOB_AFRH     = *GPIOB_AFRH  |(0x00000003);//alternate function low 
}
void delay()
{

	volatile unsigned int i=0;
	for(i=0;i<1000000;i++);
}
void TIMER10_LED(void)
{    			
        while(!(*TIM10_SR  & (1<<0))); //check the flag set
        *TIM10_SR = *TIM10_SR & (~(1<<0));

	if(*GPIOB_ODR & 1<<8)
	{
		*GPIOB_ODR  = *GPIOB_ODR &~(1<<8); // LED ON
	}
	else
	{

		*GPIOB_ODR  = *GPIOB_ODR |(1<<8); // LED OFF
	}		
}
