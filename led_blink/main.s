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
	.loc 1 40 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 42 6
	bl	RCC_CONFIG
	.loc 1 43 6
	bl	TIMER10_CONFIG
	.loc 1 45 6
	bl	GPIO_CONFIG
.L2:
	.loc 1 48 7 discriminator 1
	bl	LED_BLINK
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
	.loc 1 53 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 54 22
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 54 7
	ldr	r3, .L5
	ldr	r3, [r3]
	.loc 1 54 35
	orr	r2, r2, #4
	.loc 1 54 20
	str	r2, [r3]
	.loc 1 55 17
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 55 7
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 55 25
	bic	r2, r2, #65536
	.loc 1 55 15
	str	r2, [r3]
	.loc 1 56 17
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 56 7
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 56 25
	orr	r2, r2, #65536
	.loc 1 56 15
	str	r2, [r3]
	.loc 1 57 12
	nop
.L4:
	.loc 1 57 14 discriminator 1
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 57 22 discriminator 1
	and	r3, r3, #131072
	.loc 1 57 12 discriminator 1
	cmp	r3, #0
	beq	.L4
	.loc 1 59 19
	ldr	r3, .L5+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 59 7
	ldr	r3, .L5+8
	ldr	r3, [r3]
	.loc 1 59 29
	bic	r2, r2, #3
	.loc 1 59 17
	str	r2, [r3]
	.loc 1 60 19
	ldr	r3, .L5+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 60 7
	ldr	r3, .L5+8
	ldr	r3, [r3]
	.loc 1 60 29
	orr	r2, r2, #1
	.loc 1 60 17
	str	r2, [r3]
	.loc 1 61 11
	nop
	.loc 1 61 14
	ldr	r3, .L5+8
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 63 22
	ldr	r3, .L5+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 63 7
	ldr	r3, .L5+12
	ldr	r3, [r3]
	.loc 1 63 35
	orr	r2, r2, #131072
	.loc 1 63 20
	str	r2, [r3]
	.loc 1 65 1
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
	.global	TIMER10_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	TIMER10_CONFIG, %function
TIMER10_CONFIG:
.LFB2:
	.loc 1 67 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 69 16
	ldr	r3, .L8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 69 3
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 69 27
	orr	r2, r2, #128
	.loc 1 69 14
	str	r2, [r3]
	.loc 1 72 26
	ldr	r3, .L8
	ldr	r2, [r3]
	.loc 1 72 2
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 72 26
	ldr	r2, [r2]
	.loc 1 72 13
	str	r2, [r3]
	.loc 1 75 26
	ldr	r3, .L8
	ldr	r2, [r3]
	.loc 1 75 2
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 75 26
	ldr	r2, [r2]
	.loc 1 75 13
	str	r2, [r3]
	.loc 1 78 26
	ldr	r3, .L8
	ldr	r2, [r3]
	.loc 1 78 2
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 78 26
	ldr	r2, [r2]
	.loc 1 78 13
	str	r2, [r3]
	.loc 1 81 16
	ldr	r3, .L8+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 81 2
	ldr	r3, .L8+4
	ldr	r3, [r3]
	.loc 1 81 28
	orr	r2, r2, #1
	.loc 1 81 14
	str	r2, [r3]
	.loc 1 84 14
	ldr	r3, .L8+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 84 2
	ldr	r3, .L8+8
	ldr	r3, [r3]
	.loc 1 84 24
	bic	r2, r2, #1
	.loc 1 84 12
	str	r2, [r3]
	.loc 1 87 15
	ldr	r3, .L8+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 87 2
	ldr	r3, .L8+12
	ldr	r3, [r3]
	.loc 1 87 26
	orr	r2, r2, #1
	.loc 1 87 13
	str	r2, [r3]
	.loc 1 90 3
	ldr	r3, .L8+16
	ldr	r3, [r3]
	.loc 1 90 14
	mov	r2, #1000
	str	r2, [r3]
	.loc 1 92 2
	ldr	r3, .L8+20
	ldr	r3, [r3]
	.loc 1 92 13
	movw	r2, #25000
	str	r2, [r3]
	.loc 1 95 2
	ldr	r3, .L8+24
	ldr	r3, [r3]
	.loc 1 95 13
	mov	r2, #1000
	str	r2, [r3]
	.loc 1 97 15
	ldr	r3, .L8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 97 2
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 97 26
	orr	r2, r2, #1
	.loc 1 97 13
	str	r2, [r3]
	.loc 1 100 1
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
	.word	TIM10_CR1
	.word	TIM10_DIER
	.word	TIM10_SR
	.word	TIM10_EGR
	.word	TIM10_CNT
	.word	TIM10_PSC
	.word	TIM10_ARR
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
	.loc 1 103 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 104 8
	ldr	r3, .L11
	ldr	r3, [r3]
	.loc 1 104 21
	mov	r2, #67108864
	str	r2, [r3]
	.loc 1 105 8
	ldr	r3, .L11+4
	ldr	r3, [r3]
	.loc 1 105 22
	mov	r2, #8192
	str	r2, [r3]
	.loc 1 106 8
	ldr	r3, .L11+8
	ldr	r3, [r3]
	.loc 1 106 19
	mov	r2, #8192
	str	r2, [r3]
	.loc 1 107 1
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
	.word	GPIOC_MODER
	.word	GPIOC_OTYPER
	.word	GPIOC_ODR
	.cfi_endproc
.LFE3:
	.size	GPIO_CONFIG, .-GPIO_CONFIG
	.align	1
	.global	LED_BLINK
	.syntax unified
	.thumb
	.thumb_func
	.type	LED_BLINK, %function
LED_BLINK:
.LFB4:
	.loc 1 109 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 112 14
	nop
.L14:
	.loc 1 112 17 discriminator 1
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 112 27 discriminator 1
	and	r3, r3, #1
	.loc 1 112 14 discriminator 1
	cmp	r3, #0
	beq	.L14
	.loc 1 113 20
	ldr	r3, .L18
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 113 8
	ldr	r3, .L18
	ldr	r3, [r3]
	.loc 1 113 30
	bic	r2, r2, #1
	.loc 1 113 18
	str	r2, [r3]
	.loc 1 115 6
	ldr	r3, .L18+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 115 17
	and	r3, r3, #8192
	.loc 1 115 5
	cmp	r3, #0
	beq	.L15
	.loc 1 118 16
	ldr	r3, .L18+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 118 3
	ldr	r3, .L18+4
	ldr	r3, [r3]
	.loc 1 118 27
	bic	r2, r2, #8192
	.loc 1 118 14
	str	r2, [r3]
	.loc 1 131 1
	b	.L17
.L15:
	.loc 1 122 23
	ldr	r3, .L18+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 122 10
	ldr	r3, .L18+4
	ldr	r3, [r3]
	.loc 1 122 34
	orr	r2, r2, #8192
	.loc 1 122 21
	str	r2, [r3]
.L17:
	.loc 1 131 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L19:
	.align	2
.L18:
	.word	TIM10_SR
	.word	GPIOC_ODR
	.cfi_endproc
.LFE4:
	.size	LED_BLINK, .-LED_BLINK
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1dd
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0xc
	.4byte	.LASF25
	.4byte	.LASF26
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
	.4byte	.LASF23
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
	.4byte	TIM10_CR1
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x1
	.byte	0x1a
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_CNT
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x1
	.byte	0x1b
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_PSC
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x1
	.byte	0x1c
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_ARR
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1d
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_SR
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1e
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_EGR
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1f
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	TIM10_DIER
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x1
	.byte	0x6c
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x1
	.byte	0x66
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x1
	.byte	0x42
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x1
	.byte	0x34
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x1
	.byte	0x27
	.byte	0x5
	.4byte	0x1d9
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
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
	.uleb128 0x7
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
	.uleb128 0x8
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
.LASF7:
	.ascii	"GPIOC_ODR\000"
.LASF23:
	.ascii	"unsigned int\000"
.LASF25:
	.ascii	"main.c\000"
.LASF21:
	.ascii	"RCC_CONFIG\000"
.LASF26:
	.ascii	"/home/linux/Documents/STM/STM32F401CC/led_blink\000"
.LASF10:
	.ascii	"STK_VAL\000"
.LASF17:
	.ascii	"TIM10_DIER\000"
.LASF14:
	.ascii	"TIM10_ARR\000"
.LASF24:
	.ascii	"GNU C17 10.3.1 20210824 (release) -mcpu=cortex-m4 -"
	.ascii	"mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -march=ar"
	.ascii	"mv7e-m+fp -g\000"
.LASF19:
	.ascii	"GPIO_CONFIG\000"
.LASF4:
	.ascii	"RCC_APB2ENR\000"
.LASF5:
	.ascii	"GPIOC_MODER\000"
.LASF18:
	.ascii	"LED_BLINK\000"
.LASF1:
	.ascii	"RCC_PLLCFGR\000"
.LASF11:
	.ascii	"TIM10_CR1\000"
.LASF22:
	.ascii	"main\000"
.LASF13:
	.ascii	"TIM10_PSC\000"
.LASF12:
	.ascii	"TIM10_CNT\000"
.LASF16:
	.ascii	"TIM10_EGR\000"
.LASF15:
	.ascii	"TIM10_SR\000"
.LASF20:
	.ascii	"TIMER10_CONFIG\000"
.LASF0:
	.ascii	"RCC_CR\000"
.LASF8:
	.ascii	"STK_CTRL\000"
.LASF3:
	.ascii	"RCC_AHB1ENR\000"
.LASF9:
	.ascii	"STK_LOAD\000"
.LASF6:
	.ascii	"GPIOC_OTYPER\000"
.LASF2:
	.ascii	"RCC_CFGR\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
