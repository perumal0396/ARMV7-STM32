	.cpu cortex-m4
	.arch armv7e-m
	.fpu fpv4-sp-d16
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	RCC_CR
	.data
	.align	2
	.type	RCC_CR, %object
	.size	RCC_CR, 4
RCC_CR:
	.word	1073887232
	.global	RCC_PLLCFGR
	.align	2
	.type	RCC_PLLCFGR, %object
	.size	RCC_PLLCFGR, 4
RCC_PLLCFGR:
	.word	1073887236
	.global	RCC_CFGR
	.align	2
	.type	RCC_CFGR, %object
	.size	RCC_CFGR, 4
RCC_CFGR:
	.word	1073887240
	.global	RCC_AHB1ENR
	.align	2
	.type	RCC_AHB1ENR, %object
	.size	RCC_AHB1ENR, 4
RCC_AHB1ENR:
	.word	1073887280
	.global	RCC_APB2ENR
	.align	2
	.type	RCC_APB2ENR, %object
	.size	RCC_APB2ENR, 4
RCC_APB2ENR:
	.word	1073887300
	.global	GPIOB_MODER
	.align	2
	.type	GPIOB_MODER, %object
	.size	GPIOB_MODER, 4
GPIOB_MODER:
	.word	1073873920
	.global	GPIOB_OTYPER
	.align	2
	.type	GPIOB_OTYPER, %object
	.size	GPIOB_OTYPER, 4
GPIOB_OTYPER:
	.word	1073873924
	.global	GPIOB_ODR
	.align	2
	.type	GPIOB_ODR, %object
	.size	GPIOB_ODR, 4
GPIOB_ODR:
	.word	1073873940
	.global	GPIOB_PUPDR
	.align	2
	.type	GPIOB_PUPDR, %object
	.size	GPIOB_PUPDR, 4
GPIOB_PUPDR:
	.word	1073873932
	.global	GPIOB_AFRL
	.align	2
	.type	GPIOB_AFRL, %object
	.size	GPIOB_AFRL, 4
GPIOB_AFRL:
	.word	1073873952
	.global	GPIOB_AFRH
	.align	2
	.type	GPIOB_AFRH, %object
	.size	GPIOB_AFRH, 4
GPIOB_AFRH:
	.word	1073873956
	.global	TIM10_CR1
	.align	2
	.type	TIM10_CR1, %object
	.size	TIM10_CR1, 4
TIM10_CR1:
	.word	1073824768
	.global	TIM10_CNT
	.align	2
	.type	TIM10_CNT, %object
	.size	TIM10_CNT, 4
TIM10_CNT:
	.word	1073824804
	.global	TIM10_PSC
	.align	2
	.type	TIM10_PSC, %object
	.size	TIM10_PSC, 4
TIM10_PSC:
	.word	1073824808
	.global	TIM10_ARR
	.align	2
	.type	TIM10_ARR, %object
	.size	TIM10_ARR, 4
TIM10_ARR:
	.word	1073824812
	.global	TIM10_SR
	.align	2
	.type	TIM10_SR, %object
	.size	TIM10_SR, 4
TIM10_SR:
	.word	1073824784
	.global	TIM10_EGR
	.align	2
	.type	TIM10_EGR, %object
	.size	TIM10_EGR, 4
TIM10_EGR:
	.word	1073824788
	.global	TIM10_DIER
	.align	2
	.type	TIM10_DIER, %object
	.size	TIM10_DIER, 4
TIM10_DIER:
	.word	1073824780
	.global	TIM10_CCMR1
	.align	2
	.type	TIM10_CCMR1, %object
	.size	TIM10_CCMR1, 4
TIM10_CCMR1:
	.word	1073824792
	.global	TIM10_CCR1
	.align	2
	.type	TIM10_CCR1, %object
	.size	TIM10_CCR1, 4
TIM10_CCR1:
	.word	1073824820
	.global	TIM10_CCER
	.align	2
	.type	TIM10_CCER, %object
	.size	TIM10_CCER, 4
TIM10_CCER:
	.word	1073824800
	.global	NVIC_ISER
	.align	2
	.type	NVIC_ISER, %object
	.size	NVIC_ISER, 4
NVIC_ISER:
	.word	-536813312
	.global	NVIC_ICER
	.align	2
	.type	NVIC_ICER, %object
	.size	NVIC_ICER, 4
NVIC_ICER:
	.word	-536813184
	.global	NVIC_ISPR
	.align	2
	.type	NVIC_ISPR, %object
	.size	NVIC_ISPR, 4
NVIC_ISPR:
	.word	-536813056
	.global	NVIC_ICPR
	.align	2
	.type	NVIC_ICPR, %object
	.size	NVIC_ICPR, 4
NVIC_ICPR:
	.word	-536812928
	.global	NVIC_IABR
	.align	2
	.type	NVIC_IABR, %object
	.size	NVIC_IABR, 4
NVIC_IABR:
	.word	-536812800
	.global	NVIC_IPR
	.align	2
	.type	NVIC_IPR, %object
	.size	NVIC_IPR, 4
NVIC_IPR:
	.word	-536812544
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 49 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 51 6
	bl	RCC_CONFIG
	.loc 1 52 6
	bl	TIMER10_CONFIG
	.loc 1 53 6
	bl	GPIO_CONFIG
.L4:
	.loc 1 68 7
	nop
.L2:
	.loc 1 68 10 discriminator 1
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 68 20 discriminator 1
	and	r3, r3, #2
	.loc 1 68 7 discriminator 1
	cmp	r3, #0
	beq	.L2
	.loc 1 71 17
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 71 2
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 71 30
	bic	r2, r2, #112
	.loc 1 71 15
	str	r2, [r3]
	.loc 1 72 24
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 72 9
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 72 36
	orr	r2, r2, #32
	.loc 1 72 22
	str	r2, [r3]
	.loc 1 74 9
	ldr	r3, .L5+8
	ldr	r3, [r3]
	.loc 1 74 21
	movs	r2, #100
	str	r2, [r3]
	.loc 1 76 7
	nop
.L3:
	.loc 1 76 10 discriminator 1
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 76 20 discriminator 1
	and	r3, r3, #2
	.loc 1 76 7 discriminator 1
	cmp	r3, #0
	beq	.L3
	.loc 1 78 17
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 78 2
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 78 30
	bic	r2, r2, #112
	.loc 1 78 15
	str	r2, [r3]
	.loc 1 79 24
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 79 9
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 79 36
	orr	r2, r2, #16
	.loc 1 79 22
	str	r2, [r3]
	.loc 1 81 9
	ldr	r3, .L5+8
	ldr	r3, [r3]
	.loc 1 81 21
	movs	r2, #25
	str	r2, [r3]
	.loc 1 68 7
	b	.L4
.L6:
	.align	2
.L5:
	.word	TIM10_SR
	.word	TIM10_CCMR1
	.word	TIM10_CCR1
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	1
	.global	RCC_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	RCC_CONFIG, %function
RCC_CONFIG:
.LFB1:
	.loc 1 86 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 87 22
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 87 7
	ldr	r3, .L9
	ldr	r3, [r3]
	.loc 1 87 35
	orr	r2, r2, #4
	.loc 1 87 20
	str	r2, [r3]
	.loc 1 88 22
	ldr	r3, .L9
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 88 7
	ldr	r3, .L9
	ldr	r3, [r3]
	.loc 1 88 35
	orr	r2, r2, #2
	.loc 1 88 20
	str	r2, [r3]
	.loc 1 89 17
	ldr	r3, .L9+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 89 7
	ldr	r3, .L9+4
	ldr	r3, [r3]
	.loc 1 89 25
	bic	r2, r2, #65536
	.loc 1 89 15
	str	r2, [r3]
	.loc 1 90 17
	ldr	r3, .L9+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 90 7
	ldr	r3, .L9+4
	ldr	r3, [r3]
	.loc 1 90 25
	orr	r2, r2, #65536
	.loc 1 90 15
	str	r2, [r3]
	.loc 1 91 12
	nop
.L8:
	.loc 1 91 14 discriminator 1
	ldr	r3, .L9+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 91 22 discriminator 1
	and	r3, r3, #131072
	.loc 1 91 12 discriminator 1
	cmp	r3, #0
	beq	.L8
	.loc 1 93 19
	ldr	r3, .L9+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 93 7
	ldr	r3, .L9+8
	ldr	r3, [r3]
	.loc 1 93 29
	bic	r2, r2, #3
	.loc 1 93 17
	str	r2, [r3]
	.loc 1 94 19
	ldr	r3, .L9+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 94 7
	ldr	r3, .L9+8
	ldr	r3, [r3]
	.loc 1 94 29
	orr	r2, r2, #1
	.loc 1 94 17
	str	r2, [r3]
	.loc 1 95 12
	nop
	.loc 1 95 15
	ldr	r3, .L9+8
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 97 22
	ldr	r3, .L9+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 97 7
	ldr	r3, .L9+12
	ldr	r3, [r3]
	.loc 1 97 35
	orr	r2, r2, #131072
	.loc 1 97 20
	str	r2, [r3]
	.loc 1 98 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L10:
	.align	2
.L9:
	.word	RCC_AHB1ENR
	.word	RCC_CR
	.word	RCC_CFGR
	.word	RCC_APB2ENR
	.cfi_endproc
.LFE1:
	.size	RCC_CONFIG, .-RCC_CONFIG
	.align	1
	.global	TIMER10_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	TIMER10_CONFIG, %function
TIMER10_CONFIG:
.LFB2:
	.loc 1 100 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 102 15
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 102 2
	ldr	r3, .L12
	ldr	r3, [r3]
	.loc 1 102 26
	orr	r2, r2, #128
	.loc 1 102 13
	str	r2, [r3]
	.loc 1 104 26
	ldr	r3, .L12
	ldr	r2, [r3]
	.loc 1 104 2
	ldr	r3, .L12
	ldr	r3, [r3]
	.loc 1 104 26
	ldr	r2, [r2]
	.loc 1 104 13
	str	r2, [r3]
	.loc 1 106 26
	ldr	r3, .L12
	ldr	r2, [r3]
	.loc 1 106 2
	ldr	r3, .L12
	ldr	r3, [r3]
	.loc 1 106 26
	ldr	r2, [r2]
	.loc 1 106 13
	str	r2, [r3]
	.loc 1 108 26
	ldr	r3, .L12
	ldr	r2, [r3]
	.loc 1 108 2
	ldr	r3, .L12
	ldr	r3, [r3]
	.loc 1 108 26
	ldr	r2, [r2]
	.loc 1 108 13
	str	r2, [r3]
	.loc 1 110 14
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 110 2
	ldr	r3, .L12+4
	ldr	r3, [r3]
	.loc 1 110 24
	bic	r2, r2, #1
	.loc 1 110 12
	str	r2, [r3]
	.loc 1 112 15
	ldr	r3, .L12+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 112 2
	ldr	r3, .L12+8
	ldr	r3, [r3]
	.loc 1 112 26
	orr	r2, r2, #1
	.loc 1 112 13
	str	r2, [r3]
	.loc 1 114 17
	ldr	r3, .L12+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 114 2
	ldr	r3, .L12+12
	ldr	r3, [r3]
	.loc 1 114 30
	bic	r2, r2, #112
	.loc 1 114 15
	str	r2, [r3]
	.loc 1 116 24
	ldr	r3, .L12+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 116 9
	ldr	r3, .L12+12
	ldr	r3, [r3]
	.loc 1 116 36
	orr	r2, r2, #16
	.loc 1 116 22
	str	r2, [r3]
	.loc 1 118 17
	ldr	r3, .L12+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 118 2
	ldr	r3, .L12+12
	ldr	r3, [r3]
	.loc 1 118 30
	bic	r2, r2, #8
	.loc 1 118 15
	str	r2, [r3]
	.loc 1 120 24
	ldr	r3, .L12+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 120 9
	ldr	r3, .L12+12
	ldr	r3, [r3]
	.loc 1 120 37
	bic	r2, r2, #3
	.loc 1 120 22
	str	r2, [r3]
	.loc 1 122 2
	ldr	r3, .L12+16
	ldr	r3, [r3]
	.loc 1 122 13
	movs	r2, #0
	str	r2, [r3]
	.loc 1 124 2
	ldr	r3, .L12+20
	ldr	r3, [r3]
	.loc 1 124 13
	mov	r2, #1000
	str	r2, [r3]
	.loc 1 126 2
	ldr	r3, .L12+24
	ldr	r3, [r3]
	.loc 1 126 13
	mov	r2, #1000
	str	r2, [r3]
	.loc 1 132 23
	ldr	r3, .L12+28
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 132 9
	ldr	r3, .L12+28
	ldr	r3, [r3]
	.loc 1 132 35
	orr	r2, r2, #1
	.loc 1 132 21
	str	r2, [r3]
	.loc 1 134 9
	ldr	r3, .L12+32
	ldr	r3, [r3]
	.loc 1 134 21
	movs	r2, #25
	str	r2, [r3]
	.loc 1 136 15
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 136 2
	ldr	r3, .L12
	ldr	r3, [r3]
	.loc 1 136 26
	orr	r2, r2, #1
	.loc 1 136 13
	str	r2, [r3]
	.loc 1 137 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	TIM10_CR1
	.word	TIM10_SR
	.word	TIM10_EGR
	.word	TIM10_CCMR1
	.word	TIM10_CNT
	.word	TIM10_PSC
	.word	TIM10_ARR
	.word	TIM10_CCER
	.word	TIM10_CCR1
	.cfi_endproc
.LFE2:
	.size	TIMER10_CONFIG, .-TIMER10_CONFIG
	.align	1
	.global	GPIO_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	GPIO_CONFIG, %function
GPIO_CONFIG:
.LFB3:
	.loc 1 139 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 140 23
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 140 8
	ldr	r3, .L15
	ldr	r3, [r3]
	.loc 1 140 36
	bic	r2, r2, #131072
	.loc 1 140 21
	str	r2, [r3]
	.loc 1 141 23
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 141 8
	ldr	r3, .L15
	ldr	r3, [r3]
	.loc 1 141 36
	orr	r2, r2, #131072
	.loc 1 141 21
	str	r2, [r3]
	.loc 1 143 38
	ldr	r3, .L15+4
	ldr	r2, [r3]
	.loc 1 143 8
	ldr	r3, .L15+4
	ldr	r3, [r3]
	.loc 1 143 38
	ldr	r2, [r2]
	.loc 1 143 22
	str	r2, [r3]
	.loc 1 144 21
	ldr	r3, .L15+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 144 8
	ldr	r3, .L15+8
	ldr	r3, [r3]
	.loc 1 144 32
	orr	r2, r2, #256
	.loc 1 144 19
	str	r2, [r3]
	.loc 1 146 23
	ldr	r3, .L15+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 146 8
	ldr	r3, .L15+12
	ldr	r3, [r3]
	.loc 1 146 36
	orr	r2, r2, #131072
	.loc 1 146 21
	str	r2, [r3]
	.loc 1 148 22
	ldr	r3, .L15+16
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 148 8
	ldr	r3, .L15+16
	ldr	r3, [r3]
	.loc 1 148 34
	bic	r2, r2, #3
	.loc 1 148 20
	str	r2, [r3]
	.loc 1 149 22
	ldr	r3, .L15+16
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 149 8
	ldr	r3, .L15+16
	ldr	r3, [r3]
	.loc 1 149 34
	orr	r2, r2, #3
	.loc 1 149 20
	str	r2, [r3]
	.loc 1 150 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L16:
	.align	2
.L15:
	.word	GPIOB_MODER
	.word	GPIOB_OTYPER
	.word	GPIOB_ODR
	.word	GPIOB_PUPDR
	.word	GPIOB_AFRH
	.cfi_endproc
.LFE3:
	.size	GPIO_CONFIG, .-GPIO_CONFIG
	.align	1
	.global	delay
	.syntax unified
	.thumb
	.thumb_func
	.type	delay, %function
delay:
.LFB4:
	.loc 1 152 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 154 24
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 155 7
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 155 2
	b	.L18
.L19:
	.loc 1 155 21 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L18:
	.loc 1 155 11 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 155 2 discriminator 1
	ldr	r2, .L20
	cmp	r3, r2
	bls	.L19
	.loc 1 156 1
	nop
	nop
	adds	r7, r7, #12
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L21:
	.align	2
.L20:
	.word	999999
	.cfi_endproc
.LFE4:
	.size	delay, .-delay
	.align	1
	.global	TIMER10_LED
	.syntax unified
	.thumb
	.thumb_func
	.type	TIMER10_LED, %function
TIMER10_LED:
.LFB5:
	.loc 1 158 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 159 14
	nop
.L23:
	.loc 1 159 17 discriminator 1
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 159 27 discriminator 1
	and	r3, r3, #1
	.loc 1 159 14 discriminator 1
	cmp	r3, #0
	beq	.L23
	.loc 1 160 21
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 160 9
	ldr	r3, .L27
	ldr	r3, [r3]
	.loc 1 160 31
	bic	r2, r2, #1
	.loc 1 160 19
	str	r2, [r3]
	.loc 1 162 5
	ldr	r3, .L27+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 162 16
	and	r3, r3, #256
	.loc 1 162 4
	cmp	r3, #0
	beq	.L24
	.loc 1 164 16
	ldr	r3, .L27+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 164 3
	ldr	r3, .L27+4
	ldr	r3, [r3]
	.loc 1 164 27
	bic	r2, r2, #256
	.loc 1 164 14
	str	r2, [r3]
	.loc 1 171 1
	b	.L26
.L24:
	.loc 1 169 16
	ldr	r3, .L27+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 169 3
	ldr	r3, .L27+4
	ldr	r3, [r3]
	.loc 1 169 27
	orr	r2, r2, #256
	.loc 1 169 14
	str	r2, [r3]
.L26:
	.loc 1 171 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L28:
	.align	2
.L27:
	.word	TIM10_SR
	.word	GPIOB_ODR
	.cfi_endproc
.LFE5:
	.size	TIMER10_LED, .-TIMER10_LED
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2de
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0xc
	.4byte	.LASF35
	.4byte	.LASF36
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x9
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_CR
	.uleb128 0x3
	.byte	0x4
	.4byte	0x44
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF33
	.uleb128 0x5
	.4byte	0x3d
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0xa
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_PLLCFGR
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0xb
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_CFGR
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0xc
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_AHB1ENR
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xd
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_APB2ENR
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x10
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_MODER
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x11
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_OTYPER
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0x12
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_ODR
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x1
	.byte	0x13
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_PUPDR
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0x14
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_AFRL
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0x15
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_AFRH
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x1
	.byte	0x18
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_CR1
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x1
	.byte	0x19
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_CNT
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x1
	.byte	0x1a
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_PSC
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x1
	.byte	0x1b
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_ARR
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1c
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_SR
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1d
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_EGR
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1e
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_DIER
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1f
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_CCMR1
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x1
	.byte	0x20
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_CCR1
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x1
	.byte	0x21
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_CCER
	.uleb128 0x6
	.4byte	0x44
	.4byte	0x1c1
	.uleb128 0x7
	.4byte	0x3d
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.4byte	.LASF21
	.byte	0x1
	.byte	0x24
	.byte	0x19
	.4byte	0x1d3
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISER
	.uleb128 0x3
	.byte	0x4
	.4byte	0x1b1
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0x1
	.byte	0x25
	.byte	0x19
	.4byte	0x1d3
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICER
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x1
	.byte	0x26
	.byte	0x19
	.4byte	0x1d3
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISPR
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.4byte	0x1d3
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICPR
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x1
	.byte	0x28
	.byte	0x19
	.4byte	0x1d3
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IABR
	.uleb128 0x6
	.4byte	0x44
	.4byte	0x231
	.uleb128 0x7
	.4byte	0x3d
	.byte	0x3b
	.byte	0
	.uleb128 0x2
	.4byte	.LASF26
	.byte	0x1
	.byte	0x29
	.byte	0x19
	.4byte	0x243
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IPR
	.uleb128 0x3
	.byte	0x4
	.4byte	0x221
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x1
	.byte	0x9d
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x1
	.byte	0x97
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x27f
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0x9a
	.byte	0x18
	.4byte	0x44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x1
	.byte	0x8a
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x1
	.byte	0x63
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x1
	.byte	0x55
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x1
	.byte	0x30
	.byte	0x5
	.4byte	0x2da
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2da
	.uleb128 0xc
	.ascii	"i\000"
	.byte	0x1
	.byte	0x32
	.byte	0x10
	.4byte	0x3d
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF15:
	.ascii	"TIM10_SR\000"
.LASF33:
	.ascii	"unsigned int\000"
.LASF21:
	.ascii	"NVIC_ISER\000"
.LASF35:
	.ascii	"main.c\000"
.LASF30:
	.ascii	"RCC_CONFIG\000"
.LASF5:
	.ascii	"GPIOB_MODER\000"
.LASF23:
	.ascii	"NVIC_ISPR\000"
.LASF27:
	.ascii	"TIMER10_LED\000"
.LASF20:
	.ascii	"TIM10_CCER\000"
.LASF17:
	.ascii	"TIM10_DIER\000"
.LASF34:
	.ascii	"GNU C17 10.3.1 20210824 (release) -mcpu=cortex-m4 -"
	.ascii	"mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -march=ar"
	.ascii	"mv7e-m+fp -g\000"
.LASF26:
	.ascii	"NVIC_IPR\000"
.LASF6:
	.ascii	"GPIOB_OTYPER\000"
.LASF4:
	.ascii	"RCC_APB2ENR\000"
.LASF28:
	.ascii	"GPIO_CONFIG\000"
.LASF19:
	.ascii	"TIM10_CCR1\000"
.LASF25:
	.ascii	"NVIC_IABR\000"
.LASF1:
	.ascii	"RCC_PLLCFGR\000"
.LASF11:
	.ascii	"TIM10_CR1\000"
.LASF32:
	.ascii	"main\000"
.LASF13:
	.ascii	"TIM10_PSC\000"
.LASF18:
	.ascii	"TIM10_CCMR1\000"
.LASF10:
	.ascii	"GPIOB_AFRH\000"
.LASF22:
	.ascii	"NVIC_ICER\000"
.LASF12:
	.ascii	"TIM10_CNT\000"
.LASF16:
	.ascii	"TIM10_EGR\000"
.LASF29:
	.ascii	"TIMER10_CONFIG\000"
.LASF24:
	.ascii	"NVIC_ICPR\000"
.LASF0:
	.ascii	"RCC_CR\000"
.LASF8:
	.ascii	"GPIOB_PUPDR\000"
.LASF9:
	.ascii	"GPIOB_AFRL\000"
.LASF14:
	.ascii	"TIM10_ARR\000"
.LASF31:
	.ascii	"delay\000"
.LASF3:
	.ascii	"RCC_AHB1ENR\000"
.LASF36:
	.ascii	"/home/linux/Documents/STM/STM32F401CC/COMPARE_MODE1"
	.ascii	"\000"
.LASF7:
	.ascii	"GPIOB_ODR\000"
.LASF2:
	.ascii	"RCC_CFGR\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
