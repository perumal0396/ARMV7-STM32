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
	.global	GPIOC_MODER
	.align	2
	.type	GPIOC_MODER, %object
	.size	GPIOC_MODER, 4
GPIOC_MODER:
	.word	1073874944
	.global	GPIOC_OTYPER
	.align	2
	.type	GPIOC_OTYPER, %object
	.size	GPIOC_OTYPER, 4
GPIOC_OTYPER:
	.word	1073874948
	.global	GPIOC_ODR
	.align	2
	.type	GPIOC_ODR, %object
	.size	GPIOC_ODR, 4
GPIOC_ODR:
	.word	1073874964
	.global	STK_CTRL
	.align	2
	.type	STK_CTRL, %object
	.size	STK_CTRL, 4
STK_CTRL:
	.word	-536813552
	.global	STK_LOAD
	.align	2
	.type	STK_LOAD, %object
	.size	STK_LOAD, 4
STK_LOAD:
	.word	-536813548
	.global	STK_VAL
	.align	2
	.type	STK_VAL, %object
	.size	STK_VAL, 4
STK_VAL:
	.word	-536813544
	.global	TIM9_CR1
	.align	2
	.type	TIM9_CR1, %object
	.size	TIM9_CR1, 4
TIM9_CR1:
	.word	1073823744
	.global	TIM9_CNT
	.align	2
	.type	TIM9_CNT, %object
	.size	TIM9_CNT, 4
TIM9_CNT:
	.word	1073823780
	.global	TIM9_PSC
	.align	2
	.type	TIM9_PSC, %object
	.size	TIM9_PSC, 4
TIM9_PSC:
	.word	1073823784
	.global	TIM9_ARR
	.align	2
	.type	TIM9_ARR, %object
	.size	TIM9_ARR, 4
TIM9_ARR:
	.word	1073823788
	.global	TIM9_SR
	.align	2
	.type	TIM9_SR, %object
	.size	TIM9_SR, 4
TIM9_SR:
	.word	1073823760
	.global	TIM9_EGR
	.align	2
	.type	TIM9_EGR, %object
	.size	TIM9_EGR, 4
TIM9_EGR:
	.word	1073823764
	.global	TIM9_DIER
	.align	2
	.type	TIM9_DIER, %object
	.size	TIM9_DIER, 4
TIM9_DIER:
	.word	1073823756
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
	.loc 1 50 6
	bl	RCC_CONFIG
	.loc 1 51 6
	bl	TIMER9_CONFIG
	.loc 1 52 6
	bl	GPIO_CONFIG
	.loc 1 53 6
	bl	NVIC_CONFIG
.L2:
	.loc 1 54 11 discriminator 1
	b	.L2
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
	.loc 1 61 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 62 22
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 62 7
	ldr	r3, .L5
	ldr	r3, [r3]
	.loc 1 62 35
	orr	r2, r2, #4
	.loc 1 62 20
	str	r2, [r3]
	.loc 1 63 17
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 63 7
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 63 25
	bic	r2, r2, #65536
	.loc 1 63 15
	str	r2, [r3]
	.loc 1 64 17
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 64 7
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 64 25
	orr	r2, r2, #65536
	.loc 1 64 15
	str	r2, [r3]
	.loc 1 65 12
	nop
.L4:
	.loc 1 65 14 discriminator 1
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 65 22 discriminator 1
	and	r3, r3, #131072
	.loc 1 65 12 discriminator 1
	cmp	r3, #0
	beq	.L4
	.loc 1 67 19
	ldr	r3, .L5+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 67 7
	ldr	r3, .L5+8
	ldr	r3, [r3]
	.loc 1 67 29
	bic	r2, r2, #3
	.loc 1 67 17
	str	r2, [r3]
	.loc 1 68 19
	ldr	r3, .L5+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 68 7
	ldr	r3, .L5+8
	ldr	r3, [r3]
	.loc 1 68 29
	orr	r2, r2, #1
	.loc 1 68 17
	str	r2, [r3]
	.loc 1 69 11
	nop
	.loc 1 69 14
	ldr	r3, .L5+8
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 71 22
	ldr	r3, .L5+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 71 7
	ldr	r3, .L5+12
	ldr	r3, [r3]
	.loc 1 71 35
	orr	r2, r2, #65536
	.loc 1 71 20
	str	r2, [r3]
	.loc 1 73 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L6:
	.align	2
.L5:
	.word	RCC_AHB1ENR
	.word	RCC_CR
	.word	RCC_CFGR
	.word	RCC_APB2ENR
	.cfi_endproc
.LFE1:
	.size	RCC_CONFIG, .-RCC_CONFIG
	.align	1
	.global	TIMER9_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	TIMER9_CONFIG, %function
TIMER9_CONFIG:
.LFB2:
	.loc 1 75 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 76 21
	ldr	r3, .L8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 76 9
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 76 31
	orr	r2, r2, #128
	.loc 1 76 19
	str	r2, [r3]
	.loc 1 78 31
	ldr	r3, .L8
	ldr	r2, [r3]
	.loc 1 78 9
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 78 31
	ldr	r2, [r2]
	.loc 1 78 19
	str	r2, [r3]
	.loc 1 80 31
	ldr	r3, .L8
	ldr	r2, [r3]
	.loc 1 80 9
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 80 31
	ldr	r2, [r2]
	.loc 1 80 19
	str	r2, [r3]
	.loc 1 82 31
	ldr	r3, .L8
	ldr	r2, [r3]
	.loc 1 82 9
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 82 31
	ldr	r2, [r2]
	.loc 1 82 19
	str	r2, [r3]
	.loc 1 84 22
	ldr	r3, .L8+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 84 9
	ldr	r3, .L8+4
	ldr	r3, [r3]
	.loc 1 84 33
	orr	r2, r2, #1
	.loc 1 84 20
	str	r2, [r3]
	.loc 1 86 20
	ldr	r3, .L8+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 86 9
	ldr	r3, .L8+8
	ldr	r3, [r3]
	.loc 1 86 29
	bic	r2, r2, #1
	.loc 1 86 18
	str	r2, [r3]
	.loc 1 88 21
	ldr	r3, .L8+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 88 9
	ldr	r3, .L8+12
	ldr	r3, [r3]
	.loc 1 88 31
	orr	r2, r2, #1
	.loc 1 88 19
	str	r2, [r3]
	.loc 1 90 9
	ldr	r3, .L8+16
	ldr	r3, [r3]
	.loc 1 90 19
	movs	r2, #100
	str	r2, [r3]
	.loc 1 92 2
	ldr	r3, .L8+20
	ldr	r3, [r3]
	.loc 1 92 12
	mov	r2, #1000
	str	r2, [r3]
	.loc 1 94 9
	ldr	r3, .L8+24
	ldr	r3, [r3]
	.loc 1 94 19
	movw	r2, #2500
	str	r2, [r3]
	.loc 1 96 21
	ldr	r3, .L8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 96 9
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 96 31
	orr	r2, r2, #1
	.loc 1 96 19
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
.L9:
	.align	2
.L8:
	.word	TIM9_CR1
	.word	TIM9_DIER
	.word	TIM9_SR
	.word	TIM9_EGR
	.word	TIM9_CNT
	.word	TIM9_PSC
	.word	TIM9_ARR
	.cfi_endproc
.LFE2:
	.size	TIMER9_CONFIG, .-TIMER9_CONFIG
	.align	1
	.global	NVIC_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	NVIC_CONFIG, %function
NVIC_CONFIG:
.LFB3:
	.loc 1 100 3
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 103 28
	ldr	r3, .L11
	ldr	r3, [r3]
	.loc 1 103 39
	ldr	r2, [r3]
	.loc 1 103 10
	ldr	r3, .L11
	ldr	r3, [r3]
	.loc 1 103 43
	orr	r2, r2, #16777216
	.loc 1 103 25
	str	r2, [r3]
	.loc 1 106 21
	ldr	r3, .L11+4
	ldr	r3, [r3]
	.loc 1 106 32
	ldr	r2, [r3]
	.loc 1 106 3
	ldr	r3, .L11+4
	ldr	r3, [r3]
	.loc 1 106 36
	orr	r2, r2, #16777216
	.loc 1 106 18
	str	r2, [r3]
	.loc 1 107 3
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L12:
	.align	2
.L11:
	.word	NVIC_ICPR
	.word	NVIC_ISER
	.cfi_endproc
.LFE3:
	.size	NVIC_CONFIG, .-NVIC_CONFIG
	.align	1
	.global	GPIO_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	GPIO_CONFIG, %function
GPIO_CONFIG:
.LFB4:
	.loc 1 110 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 111 8
	ldr	r3, .L14
	ldr	r3, [r3]
	.loc 1 111 21
	mov	r2, #67108864
	str	r2, [r3]
	.loc 1 112 8
	ldr	r3, .L14+4
	ldr	r3, [r3]
	.loc 1 112 22
	mov	r2, #8192
	str	r2, [r3]
	.loc 1 113 8
	ldr	r3, .L14+8
	ldr	r3, [r3]
	.loc 1 113 19
	mov	r2, #8192
	str	r2, [r3]
	.loc 1 114 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L15:
	.align	2
.L14:
	.word	GPIOC_MODER
	.word	GPIOC_OTYPER
	.word	GPIOC_ODR
	.cfi_endproc
.LFE4:
	.size	GPIO_CONFIG, .-GPIO_CONFIG
	.align	1
	.global	LED_BLINK
	.syntax unified
	.thumb
	.thumb_func
	.type	LED_BLINK, %function
LED_BLINK:
.LFB5:
	.loc 1 116 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 119 14
	nop
.L17:
	.loc 1 119 17 discriminator 1
	ldr	r3, .L21
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 119 26 discriminator 1
	and	r3, r3, #1
	.loc 1 119 14 discriminator 1
	cmp	r3, #0
	beq	.L17
	.loc 1 120 20
	ldr	r3, .L21
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 120 9
	ldr	r3, .L21
	ldr	r3, [r3]
	.loc 1 120 29
	bic	r2, r2, #1
	.loc 1 120 18
	str	r2, [r3]
	.loc 1 122 6
	ldr	r3, .L21+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 122 17
	and	r3, r3, #8192
	.loc 1 122 5
	cmp	r3, #0
	beq	.L18
	.loc 1 125 16
	ldr	r3, .L21+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 125 3
	ldr	r3, .L21+4
	ldr	r3, [r3]
	.loc 1 125 27
	bic	r2, r2, #8192
	.loc 1 125 14
	str	r2, [r3]
	.loc 1 139 1
	b	.L20
.L18:
	.loc 1 130 18
	ldr	r3, .L21+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 130 5
	ldr	r3, .L21+4
	ldr	r3, [r3]
	.loc 1 130 29
	orr	r2, r2, #8192
	.loc 1 130 16
	str	r2, [r3]
.L20:
	.loc 1 139 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L22:
	.align	2
.L21:
	.word	TIM9_SR
	.word	GPIOC_ODR
	.cfi_endproc
.LFE5:
	.size	LED_BLINK, .-LED_BLINK
	.align	1
	.global	TIM1_BRK_TIM9_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.type	TIM1_BRK_TIM9_IRQHandler, %function
TIM1_BRK_TIM9_IRQHandler:
.LFB6:
	.loc 1 141 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 143 13
	ldr	r3, .L27
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 143 2
	ldr	r3, .L27
	ldr	r3, [r3]
	.loc 1 143 22
	bic	r2, r2, #1
	.loc 1 143 11
	str	r2, [r3]
	.loc 1 144 14
	ldr	r3, .L27+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 144 25
	and	r3, r3, #8192
	.loc 1 144 13
	cmp	r3, #0
	beq	.L24
	.loc 1 146 31
	ldr	r3, .L27+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 146 18
	ldr	r3, .L27+4
	ldr	r3, [r3]
	.loc 1 146 42
	bic	r2, r2, #8192
	.loc 1 146 29
	str	r2, [r3]
	.loc 1 154 1
	b	.L26
.L24:
	.loc 1 151 31
	ldr	r3, .L27+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 151 18
	ldr	r3, .L27+4
	ldr	r3, [r3]
	.loc 1 151 42
	orr	r2, r2, #8192
	.loc 1 151 29
	str	r2, [r3]
.L26:
	.loc 1 154 1
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
	.word	TIM9_SR
	.word	GPIOC_ODR
	.cfi_endproc
.LFE6:
	.size	TIM1_BRK_TIM9_IRQHandler, .-TIM1_BRK_TIM9_IRQHandler
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x299
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0xc
	.4byte	.LASF33
	.4byte	.LASF34
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0xb
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
	.4byte	.LASF31
	.uleb128 0x5
	.4byte	0x3d
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0xc
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_PLLCFGR
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0xd
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_CFGR
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0xe
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_AHB1ENR
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xf
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_APB2ENR
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x11
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOC_MODER
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x12
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOC_OTYPER
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0x13
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOC_ODR
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x1
	.byte	0x15
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	STK_CTRL
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0x16
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	STK_LOAD
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0x17
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	STK_VAL
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x1
	.byte	0x19
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM9_CR1
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x1
	.byte	0x1a
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM9_CNT
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x1
	.byte	0x1b
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM9_PSC
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x1
	.byte	0x1c
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM9_ARR
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1d
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM9_SR
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1e
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM9_EGR
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1f
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM9_DIER
	.uleb128 0x6
	.4byte	0x44
	.4byte	0x18b
	.uleb128 0x7
	.4byte	0x3d
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x1
	.byte	0x21
	.byte	0x19
	.4byte	0x19d
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISER
	.uleb128 0x3
	.byte	0x4
	.4byte	0x17b
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x1
	.byte	0x22
	.byte	0x19
	.4byte	0x19d
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICER
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x1
	.byte	0x23
	.byte	0x19
	.4byte	0x19d
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ISPR
	.uleb128 0x2
	.4byte	.LASF21
	.byte	0x1
	.byte	0x24
	.byte	0x19
	.4byte	0x19d
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_ICPR
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0x1
	.byte	0x25
	.byte	0x19
	.4byte	0x19d
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IABR
	.uleb128 0x6
	.4byte	0x44
	.4byte	0x1fb
	.uleb128 0x7
	.4byte	0x3d
	.byte	0x3b
	.byte	0
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x1
	.byte	0x26
	.byte	0x19
	.4byte	0x20d
	.uleb128 0x5
	.byte	0x3
	.4byte	NVIC_IPR
	.uleb128 0x3
	.byte	0x4
	.4byte	0x1eb
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x1
	.byte	0x8c
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x1
	.byte	0x73
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x1
	.byte	0x6d
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x1
	.byte	0x63
	.byte	0x8
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x1
	.byte	0x4a
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x1
	.byte	0x3c
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x1
	.byte	0x30
	.byte	0x5
	.4byte	0x295
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
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
	.byte	0
	.byte	0
	.uleb128 0xa
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
.LASF31:
	.ascii	"unsigned int\000"
.LASF18:
	.ascii	"NVIC_ISER\000"
.LASF33:
	.ascii	"main.c\000"
.LASF29:
	.ascii	"RCC_CONFIG\000"
.LASF15:
	.ascii	"TIM9_SR\000"
.LASF20:
	.ascii	"NVIC_ISPR\000"
.LASF7:
	.ascii	"GPIOC_ODR\000"
.LASF10:
	.ascii	"STK_VAL\000"
.LASF11:
	.ascii	"TIM9_CR1\000"
.LASF24:
	.ascii	"TIM1_BRK_TIM9_IRQHandler\000"
.LASF32:
	.ascii	"GNU C17 10.3.1 20210824 (release) -mcpu=cortex-m4 -"
	.ascii	"mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -march=ar"
	.ascii	"mv7e-m+fp -g\000"
.LASF13:
	.ascii	"TIM9_PSC\000"
.LASF26:
	.ascii	"GPIO_CONFIG\000"
.LASF4:
	.ascii	"RCC_APB2ENR\000"
.LASF34:
	.ascii	"/home/linux/Documents/STM/STM32F401CC/TIMER9_INTERR"
	.ascii	"UPT\000"
.LASF12:
	.ascii	"TIM9_CNT\000"
.LASF25:
	.ascii	"LED_BLINK\000"
.LASF1:
	.ascii	"RCC_PLLCFGR\000"
.LASF5:
	.ascii	"GPIOC_MODER\000"
.LASF30:
	.ascii	"main\000"
.LASF14:
	.ascii	"TIM9_ARR\000"
.LASF28:
	.ascii	"TIMER9_CONFIG\000"
.LASF19:
	.ascii	"NVIC_ICER\000"
.LASF21:
	.ascii	"NVIC_ICPR\000"
.LASF17:
	.ascii	"TIM9_DIER\000"
.LASF0:
	.ascii	"RCC_CR\000"
.LASF22:
	.ascii	"NVIC_IABR\000"
.LASF27:
	.ascii	"NVIC_CONFIG\000"
.LASF8:
	.ascii	"STK_CTRL\000"
.LASF16:
	.ascii	"TIM9_EGR\000"
.LASF3:
	.ascii	"RCC_AHB1ENR\000"
.LASF23:
	.ascii	"NVIC_IPR\000"
.LASF9:
	.ascii	"STK_LOAD\000"
.LASF6:
	.ascii	"GPIOC_OTYPER\000"
.LASF2:
	.ascii	"RCC_CFGR\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
