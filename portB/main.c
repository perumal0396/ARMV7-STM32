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
//portB
volatile unsigned int *GPIOB_MODER  = (volatile unsigned int *)0x40020400;
volatile unsigned int *GPIOB_OTYPER = (volatile unsigned int *)0x40020404;
volatile unsigned int *GPIOB_ODR    = (volatile unsigned int *)0x40020414;
//portc
volatile unsigned int *GPIOC_MODER  = (volatile unsigned int *)0x40020800;
volatile unsigned int *GPIOC_OTYPER = (volatile unsigned int *)0x40020804;
volatile unsigned int *GPIOC_ODR    = (volatile unsigned int *)0x40020814;

void RCC_CONFIG(void);
void GPIO_CONFIG(void);
void LED_BLINK(void);
void port_c13(void);
void delay(void);
int main()
{
     
     RCC_CONFIG();
     GPIO_CONFIG();
     while(1)
     {    
	
        port_c13();
     	LED_BLINK(); 
     }
}

void RCC_CONFIG(void)
{
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<1); // port B configuration bit
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<2); // port C configuration bit
      *RCC_CR	      = *RCC_CR &(~0x00010000); // HSE BIT SET AND CLEAR THE 16-BIT
      *RCC_CR         = *RCC_CR | (1<<16); //HSE-ON
      while((*RCC_CR &  1<<17)==0); //HSE FLAG CHECK ON AND OFF
      
      *RCC_CFGR	     =  *RCC_CFGR & (~0x00000003); //SYSTEM CLOCK SWITCH SET AND CLEAR
      *RCC_CFGR      =  *RCC_CFGR | (1<<0);   // SYSTEM CLOCK SWITCH SET
     while(!(*RCC_CFGR & 0x00000004)==4);   // SYSTEM CLOCK SWITCH STATUS
    
}
void GPIO_CONFIG(void)
{
       *GPIOC_MODER    =  *GPIOC_MODER |(1<<26);	  
       *GPIOC_OTYPER   =  *GPIOC_OTYPER |(1<<13);	
       *GPIOC_ODR      =  0x00000000;	

       *GPIOB_MODER    = *GPIOB_MODER | (1<<4); //GENERAL PURPOSE MODE
       *GPIOB_OTYPER   =  0x00000000;// PORTB OUTPUT LED
       *GPIOB_ODR      =  *GPIOB_ODR  |(1<<2); //PORTB OUTPUT LED  
}
void delay(void)
{
	volatile unsigned int i=0;
	for(i=0;i<2500000;i++);
}
void port_c13(void)
{	  
	delay();
    if(*GPIOC_ODR  & 0x00002000)	
    { 

		*GPIOC_ODR  = *GPIOC_ODR &(~0x00002000); // LED ON
    }
    else
    {

		*GPIOC_ODR  = *GPIOC_ODR |(0x00002000); // LED OFF
    }
  
  
}
void LED_BLINK(void)
{    	
	delay();
	 if(*GPIOB_ODR & 1<<2)
  	 {

		*GPIOB_ODR  = *GPIOB_ODR &~(1<<2); // LED ON
  	 }
	 else
 	 {
        	*GPIOB_ODR  = *GPIOB_ODR |(1<<2); // LED OFF
  
 	 }
}

