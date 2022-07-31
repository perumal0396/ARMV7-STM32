/************************************************/
/*   NAME        : PERUMAL.R                    */
/*   DATE        :                              */
/*   SUBJECT     :  ARMV7-PLL-TIMER             */
/*   DESCRIPTION : LED-BLINKING                 */
/************************************************/

volatile unsigned int *RCC_CR       = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_PLLCFGR  = (volatile unsigned int *)0x40023804;
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
void RCC_PLL(void);
void GPIO_CONFIG(void);
void LED_BLINK(void);

int main()
{
     
     RCC_CONFIG();
//     RCC_PLL();
     SYS_TIMER();
     GPIO_CONFIG();
     while(1)
     {    
     	LED_BLINK(); 
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
void RCC_PLL(void)
{
	*RCC_CR	      = *RCC_CR &(~0x00010000); // HSE BIT SET AND CLEAR THE 16-BIT
      *RCC_CR         = *RCC_CR | (1<<16); //HSE-ON
      while((*RCC_CR &  (1<<17)==0)); //HSE FLAG CHECK ON AND OFF

     // *RCC_CR	     = *RCC_CR &(~1<<24); // PLL BIT OFF
       *RCC_PLLCFGR  = *RCC_PLLCFGR |(1<<22); //PLLSRC is selected as HSE

      *RCC_PLLCFGR  = *RCC_PLLCFGR & (~0x0000001f);//PLLM DIVISION SET AND CLEAR

     	*RCC_PLLCFGR  = *RCC_PLLCFGR |(25<<0); // PLLM DIVITION FACTOR is 25- 25MHZ/25=1MHZ;

     //clear the required bits
     	*RCC_PLLCFGR = *RCC_PLLCFGR & ~(0x1ff<<6);//PLLN MULTIPLACTION OF VCO

      //assign the required value on the cleared bits.
	*RCC_PLLCFGR = *RCC_PLLCFGR | (200<<6);//PLLN MULTIPLACTION OF VCO



      *RCC_PLLCFGR  = *RCC_PLLCFGR & ~(0x3<<16);
      *RCC_PLLCFGR  = *RCC_PLLCFGR | (1<<16); //PLLP DIVISION BY 4

  //    *RCC_PLLCFGR  = *RCC_PLLCFGR |(1<<22); //PLLSRC HSE OSCILATOR ON

      *RCC_CR        = *RCC_CR | (1<<24); //PLL ON
      while(!(*RCC_CR & (1<<25))); // PLL CLOCK READY FLAG

      *RCC_CFGR     = *RCC_CFGR & ~(0x3<<0); //SW SWITCH THE PLL
      *RCC_CFGR     = *RCC_CFGR | (2<<0); // SET THE PLL

      //not required //*RCC_CFGR	    = *RCC_CFGR & (~0x0000000C); //SYSTEM CLOCK SWITCH SET AND CLEAR PLL
     
      while(!(((*RCC_PLLCFGR & (0x3<<2))>>2) == 2));   // SYSTEM CLOCK SWITCH SET PLL


      *RCC_CFGR     = *RCC_CFGR &(~0x000000f0); //AHB  CLEAR bit 4,5,6,7
      *RCC_CFGR     = *RCC_CFGR|(1<<0); //AHB PRESCALER DIVIED BY 2

 //      while((*RCC_CFGR | 1<<3)==0);   // SYSTEM CLOCK SWITCH STATUS IN PLL

      *RCC_CFGR	    = *RCC_CFGR & (~0x000000C0); //SYSTEM CLOCK SWITCH SET AND CLEAR PLL
      *RCC_CFGR     = *RCC_CFGR | (1<<3);   // SYSTEM CLOCK SWITCH SET PLL
      *RCC_AHB1ENR    = *RCC_AHB1ENR |(1<<2); // port c configuration bit

}
void SYS_TIMER(void)
 {
//	  *STK_LOAD = 25000000; //
          *STK_LOAD = 3125000; // TIMER VALUES
          *STK_CTRL = 0;    //CLEAR THE FLAG   
          *STK_CTRL = *STK_CTRL | (0<<2); // CLOCK SOURCE SELECTION //PROCESSOR AHB
          *STK_CTRL = *STK_CTRL | (1<<0); //COUNTER ENABLE START TIMER
	   
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
