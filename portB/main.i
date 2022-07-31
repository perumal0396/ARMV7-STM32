# 1 "main.c"
# 1 "/home/linux/Documents/STM/STM32F401CC/portB//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 11 "main.c"
volatile unsigned int *RCC_CR = (volatile unsigned int *)0x40023800;
volatile unsigned int *RCC_PLLCFGR = (volatile unsigned int *)0x40023804;
volatile unsigned int *RCC_CFGR = (volatile unsigned int *)0x40023808;
volatile unsigned int *RCC_AHB1ENR = (volatile unsigned int *)0x40023830;
volatile unsigned int *RCC_APB2ENR = (volatile unsigned int *)0x40023844;

volatile unsigned int *GPIOB_MODER = (volatile unsigned int *)0x40020400;
volatile unsigned int *GPIOB_OTYPER = (volatile unsigned int *)0x40020404;
volatile unsigned int *GPIOB_ODR = (volatile unsigned int *)0x40020414;

volatile unsigned int *GPIOC_MODER = (volatile unsigned int *)0x40020800;
volatile unsigned int *GPIOC_OTYPER = (volatile unsigned int *)0x40020804;
volatile unsigned int *GPIOC_ODR = (volatile unsigned int *)0x40020814;

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
      *RCC_AHB1ENR = *RCC_AHB1ENR |(1<<1);
      *RCC_AHB1ENR = *RCC_AHB1ENR |(1<<2);
      *RCC_CR = *RCC_CR &(~0x00010000);
      *RCC_CR = *RCC_CR | (1<<16);
      while((*RCC_CR & 1<<17)==0);

      *RCC_CFGR = *RCC_CFGR & (~0x00000003);
      *RCC_CFGR = *RCC_CFGR | (1<<0);
     while(!(*RCC_CFGR & 0x00000004)==4);

}
void GPIO_CONFIG(void)
{
       *GPIOC_MODER = *GPIOC_MODER |(1<<26);
       *GPIOC_OTYPER = *GPIOC_OTYPER |(1<<13);
       *GPIOC_ODR = 0x00000000;

       *GPIOB_MODER = *GPIOB_MODER | (1<<4);
       *GPIOB_OTYPER = 0x00000000;
       *GPIOB_ODR = *GPIOB_ODR |(1<<2);
}
void delay(void)
{
 volatile unsigned int i=0;
 for(i=0;i<2500000;i++);
}
void port_c13(void)
{
 delay();
    if(*GPIOC_ODR & 0x00002000)
    {

  *GPIOC_ODR = *GPIOC_ODR &(~0x00002000);
    }
    else
    {

  *GPIOC_ODR = *GPIOC_ODR |(0x00002000);
    }


}
void LED_BLINK(void)
{
 delay();
  if(*GPIOB_ODR & 1<<2)
    {

  *GPIOB_ODR = *GPIOB_ODR &~(1<<2);
    }
  else
   {
         *GPIOB_ODR = *GPIOB_ODR |(1<<2);

   }
}
