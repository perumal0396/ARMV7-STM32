/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-TIMER10 & 11          */
/*   DESCRIPTION : LED-BLINKING                 */
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
//timer10
volatile unsigned int *TIM10_CR1    = (volatile unsigned int *)0x40014400;
volatile unsigned int *TIM10_CNT    = (volatile unsigned int *)0x40014424;
volatile unsigned int *TIM10_PSC    = (volatile unsigned int *)0x40014428;
volatile unsigned int *TIM10_ARR    = (volatile unsigned int *)0x4001442C;
volatile unsigned int *TIM10_SR     = (volatile unsigned int *)0x40014410;
volatile unsigned int *TIM10_EGR    = (volatile unsigned int *)0x40014414;
volatile unsigned int *TIM10_DIER   = (volatile unsigned int *)0x4001440C;
//TIMER11
volatile unsigned int *TIM11_CR1    = (volatile unsigned int *)0x40014800;
volatile unsigned int *TIM11_CNT    = (volatile unsigned int *)0x40014824;
volatile unsigned int *TIM11_PSC    = (volatile unsigned int *)0x40014828;
volatile unsigned int *TIM11_ARR    = (volatile unsigned int *)0x4001482C;
volatile unsigned int *TIM11_SR     = (volatile unsigned int *)0x40014810;
volatile unsigned int *TIM11_EGR    = (volatile unsigned int *)0x40014814;
volatile unsigned int *TIM11_DIER   = (volatile unsigned int *)0x4001480C;

//interrupt
volatile unsigned int (*NVIC_ISER)[8] = (volatile unsigned int (*)[8])0xE000E100;  
volatile unsigned int (*NVIC_ICER)[8] = (volatile unsigned int (*)[8])0xE000E180;
volatile unsigned int (*NVIC_ISPR)[8] = (volatile unsigned int (*)[8])0xE000E200;
volatile unsigned int (*NVIC_ICPR)[8] = (volatile unsigned int (*)[8])0xE000E280;
volatile unsigned int (*NVIC_IABR)[8] = (volatile unsigned int (*)[8])0xE000E300;
volatile unsigned int (*NVIC_IPR)[60] = (volatile unsigned int (*)[60])0xE000E400;

void RCC_CONFIG(void);
void TIMER10_CONFIG(void);
void TIMER11_CONFIG(void);
void GPIO_CONFIG(void);
void TIMER10_LED(void);
void TIMER11_LED(void);

int main()
{

     RCC_CONFIG();
     TIMER10_CONFIG();
     TIMER11_CONFIG();
     GPIO_CONFIG();
     while(1)
     {    
     	TIMER10_LED(); 
	TIMER11_LED();
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
    
      *RCC_APB2ENR   = *RCC_APB2ENR |(1<<17); //TIMER 10 ENABLE

      *RCC_APB2ENR   = *RCC_APB2ENR |(1<<18); //TIMER 11 ENABLE

}
void TIMER10_CONFIG(void)
{              
	 *TIM10_CR1 = *TIM10_CR1 |(1<<7); //auto-reload enable
		
	*TIM10_CR1 = *TIM10_CR1 &~(0<<3); //one plus mode disable

	*TIM10_CR1 = *TIM10_CR1 &~(0<<2); //URS-update request source in zero

	*TIM10_CR1 = *TIM10_CR1 &~(0<<1); //UDIS update disable
	
	*TIM10_DIER = *TIM10_DIER |(0<<0); //interrupt disable register

	*TIM10_SR = *TIM10_SR &~(1<<0); //status register
               
	*TIM10_EGR = *TIM10_EGR |(1<<0); //update generation

	 *TIM10_CNT = 100; //counter values
      
	*TIM10_PSC = 1000; //prescaler values

	*TIM10_ARR = 475; //auto-reload register
      
//	*TIM10_CR1 = *TIM10_CR1 |(1<<0); //counter enable
}
void TIMER11_CONFIG(void)
{
	 *TIM11_CR1 = *TIM11_CR1 |(1<<7); //auto-reload enable
	 
	*TIM11_CR1 = *TIM11_CR1 &~(0<<3); // one pluse disable

	*TIM11_CR1 = *TIM11_CR1 &~(0<<2); //URS -update request  source in zero

	*TIM11_CR1 = *TIM11_CR1 &~(0<<1); // UDIS update disaple

	*TIM11_DIER = *TIM11_DIER |(0<<0);// interrupt disable

	*TIM11_SR = *TIM11_SR &~(1<<0); // status register

	*TIM11_EGR = *TIM11_EGR |(1<<0); //update generation
	 
	*TIM11_CNT = 100;  // counter values
	
	*TIM11_PSC = 1000; //prescaler value 400 ms
	
	*TIM11_ARR = 25; //auto reload register

	*TIM11_CR1 = *TIM11_CR1 |(1<<0); //counter enable

}
void GPIO_CONFIG(void)
{
       *GPIOC_MODER    = 0x04000000; //GENERAL PURPOSE MODE
       *GPIOC_OTYPER   = 0x00002000;//13 PIN OUTPUT LED
       *GPIOC_ODR      = 0x00002000; //C13 PIN OUTPUT IN LED  
}
void TIMER10_LED(void)
{    	

	*GPIOC_ODR  = *GPIOC_ODR &(~0x00002000); // LED ON

	*TIM10_CR1 = *TIM10_CR1 |(1<<0); //counter enable
		
        while(!(*TIM10_SR  & (1<<0))); //check the flag set
        *TIM10_SR = *TIM10_SR & (~(1<<0));	

	*TIM10_CR1 = *TIM10_CR1 &~(1<<0); //counter disable
		
}
void TIMER11_LED(void)
{

      *GPIOC_ODR  = *GPIOC_ODR |(0x00002000); // LED OFF


     *TIM11_CR1 = *TIM11_CR1 |(1<<0); //counter enable
		
      while(!(*TIM11_SR & (1<<0))); //CHECK flag set
      *TIM11_SR = *TIM11_SR & (~(1<<0));


	*TIM11_CR1 = *TIM11_CR1 &~(1<<0); //counter disable
		
}
