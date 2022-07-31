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
	.loc 1 31 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 33 6
	bl	RCC_CONFIG
	.loc 1 34 6
	bl	GPIO_CONFIG
.L2:
	.loc 1 38 9 discriminator 1
	bl	port_c13
	.loc 1 39 7 discriminator 1
	bl	LED_BLINK
	.loc 1 38 9 discriminator 1
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
	.loc 1 44 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 45 22
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 45 7
	ldr	r3, .L5
	ldr	r3, [r3]
	.loc 1 45 35
	orr	r2, r2, #2
	.loc 1 45 20
	str	r2, [r3]
	.loc 1 46 22
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 46 7
	ldr	r3, .L5
	ldr	r3, [r3]
	.loc 1 46 35
	orr	r2, r2, #4
	.loc 1 46 20
	str	r2, [r3]
	.loc 1 47 17
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 47 7
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 47 25
	bic	r2, r2, #65536
	.loc 1 47 15
	str	r2, [r3]
	.loc 1 48 17
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 48 7
	ldr	r3, .L5+4
	ldr	r3, [r3]
	.loc 1 48 25
	orr	r2, r2, #65536
	.loc 1 48 15
	str	r2, [r3]
	.loc 1 49 12
	nop
.L4:
	.loc 1 49 14 discriminator 1
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 49 22 discriminator 1
	and	r3, r3, #131072
	.loc 1 49 12 discriminator 1
	cmp	r3, #0
	beq	.L4
	.loc 1 51 19
	ldr	r3, .L5+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 51 7
	ldr	r3, .L5+8
	ldr	r3, [r3]
	.loc 1 51 29
	bic	r2, r2, #3
	.loc 1 51 17
	str	r2, [r3]
	.loc 1 52 19
	ldr	r3, .L5+8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 52 7
	ldr	r3, .L5+8
	ldr	r3, [r3]
	.loc 1 52 29
	orr	r2, r2, #1
	.loc 1 52 17
	str	r2, [r3]
	.loc 1 53 11
	nop
	.loc 1 53 14
	ldr	r3, .L5+8
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 55 1
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
	.cfi_endproc
.LFE1:
	.size	RCC_CONFIG, .-RCC_CONFIG
	.align	1
	.global	GPIO_CONFIG
	.syntax unified
	.thumb
	.thumb_func
	.type	GPIO_CONFIG, %function
GPIO_CONFIG:
.LFB2:
	.loc 1 57 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 58 23
	ldr	r3, .L8
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 58 8
	ldr	r3, .L8
	ldr	r3, [r3]
	.loc 1 58 36
	orr	r2, r2, #67108864
	.loc 1 58 21
	str	r2, [r3]
	.loc 1 59 24
	ldr	r3, .L8+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 59 8
	ldr	r3, .L8+4
	ldr	r3, [r3]
	.loc 1 59 38
	orr	r2, r2, #8192
	.loc 1 59 22
	str	r2, [r3]
	.loc 1 60 8
	ldr	r3, .L8+8
	ldr	r3, [r3]
	.loc 1 60 19
	movs	r2, #0
	str	r2, [r3]
	.loc 1 62 23
	ldr	r3, .L8+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 62 8
	ldr	r3, .L8+12
	ldr	r3, [r3]
	.loc 1 62 36
	orr	r2, r2, #16
	.loc 1 62 21
	str	r2, [r3]
	.loc 1 63 8
	ldr	r3, .L8+16
	ldr	r3, [r3]
	.loc 1 63 22
	movs	r2, #0
	str	r2, [r3]
	.loc 1 64 21
	ldr	r3, .L8+20
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 64 8
	ldr	r3, .L8+20
	ldr	r3, [r3]
	.loc 1 64 32
	orr	r2, r2, #4
	.loc 1 64 19
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
.L9:
	.align	2
.L8:
	.word	GPIOC_MODER
	.word	GPIOC_OTYPER
	.word	GPIOC_ODR
	.word	GPIOB_MODER
	.word	GPIOB_OTYPER
	.word	GPIOB_ODR
	.cfi_endproc
.LFE2:
	.size	GPIO_CONFIG, .-GPIO_CONFIG
	.align	1
	.global	delay
	.syntax unified
	.thumb
	.thumb_func
	.type	delay, %function
delay:
.LFB3:
	.loc 1 67 1
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
	.loc 1 68 24
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 69 7
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 69 2
	b	.L11
.L12:
	.loc 1 69 21 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L11:
	.loc 1 69 11 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 69 2 discriminator 1
	ldr	r2, .L13
	cmp	r3, r2
	bcc	.L12
	.loc 1 70 1
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
.L14:
	.align	2
.L13:
	.word	2500000
	.cfi_endproc
.LFE3:
	.size	delay, .-delay
	.align	1
	.global	port_c13
	.syntax unified
	.thumb
	.thumb_func
	.type	port_c13, %function
port_c13:
.LFB4:
	.loc 1 72 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 73 2
	bl	delay
	.loc 1 74 8
	ldr	r3, .L19
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 74 19
	and	r3, r3, #8192
	.loc 1 74 7
	cmp	r3, #0
	beq	.L16
	.loc 1 77 16
	ldr	r3, .L19
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 77 3
	ldr	r3, .L19
	ldr	r3, [r3]
	.loc 1 77 27
	bic	r2, r2, #8192
	.loc 1 77 14
	str	r2, [r3]
	.loc 1 86 1
	b	.L18
.L16:
	.loc 1 82 16
	ldr	r3, .L19
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 82 3
	ldr	r3, .L19
	ldr	r3, [r3]
	.loc 1 82 27
	orr	r2, r2, #8192
	.loc 1 82 14
	str	r2, [r3]
.L18:
	.loc 1 86 1
	nop
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	GPIOC_ODR
	.cfi_endproc
.LFE4:
	.size	port_c13, .-port_c13
	.align	1
	.global	LED_BLINK
	.syntax unified
	.thumb
	.thumb_func
	.type	LED_BLINK, %function
LED_BLINK:
.LFB5:
	.loc 1 88 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 89 2
	bl	delay
	.loc 1 90 6
	ldr	r3, .L25
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 90 17
	and	r3, r3, #4
	.loc 1 90 5
	cmp	r3, #0
	beq	.L22
	.loc 1 93 16
	ldr	r3, .L25
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 93 3
	ldr	r3, .L25
	ldr	r3, [r3]
	.loc 1 93 27
	bic	r2, r2, #4
	.loc 1 93 14
	str	r2, [r3]
	.loc 1 100 1
	b	.L24
.L22:
	.loc 1 97 23
	ldr	r3, .L25
	ldr	r3, [r3]
	ldr	r2, [r3]
	.loc 1 97 10
	ldr	r3, .L25
	ldr	r3, [r3]
	.loc 1 97 34
	orr	r2, r2, #4
	.loc 1 97 21
	str	r2, [r3]
.L24:
	.loc 1 100 1
	nop
	pop	{r7, pc}
.L26:
	.align	2
.L25:
	.word	GPIOB_ODR
	.cfi_endproc
.LFE5:
	.size	LED_BLINK, .-LED_BLINK
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x183
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0xc
	.4byte	.LASF18
	.4byte	.LASF19
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
	.4byte	.LASF16
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
	.4byte	GPIOB_MODER
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x12
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_OTYPER
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0x13
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_ODR
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x1
	.byte	0x15
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOC_MODER
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0x16
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOC_OTYPER
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0x17
	.byte	0x18
	.4byte	0x37
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOC_ODR
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x1
	.byte	0x57
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x1
	.byte	0x47
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x1
	.byte	0x42
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x145
	.uleb128 0x8
	.ascii	"i\000"
	.byte	0x1
	.byte	0x44
	.byte	0x18
	.4byte	0x44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x38
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x1
	.byte	0x2b
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1e
	.byte	0x5
	.4byte	0x17f
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.ascii	"GPIOB_ODR\000"
.LASF16:
	.ascii	"unsigned int\000"
.LASF1:
	.ascii	"RCC_PLLCFGR\000"
.LASF19:
	.ascii	"/home/linux/Documents/STM/STM32F401CC/portB\000"
.LASF10:
	.ascii	"GPIOC_ODR\000"
.LASF5:
	.ascii	"GPIOB_MODER\000"
.LASF20:
	.ascii	"delay\000"
.LASF12:
	.ascii	"port_c13\000"
.LASF3:
	.ascii	"RCC_AHB1ENR\000"
.LASF17:
	.ascii	"GNU C17 10.3.1 20210824 (release) -mcpu=cortex-m4 -"
	.ascii	"mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -march=ar"
	.ascii	"mv7e-m+fp -g\000"
.LASF0:
	.ascii	"RCC_CR\000"
.LASF18:
	.ascii	"main.c\000"
.LASF6:
	.ascii	"GPIOB_OTYPER\000"
.LASF4:
	.ascii	"RCC_APB2ENR\000"
.LASF9:
	.ascii	"GPIOC_OTYPER\000"
.LASF15:
	.ascii	"main\000"
.LASF8:
	.ascii	"GPIOC_MODER\000"
.LASF14:
	.ascii	"RCC_CONFIG\000"
.LASF11:
	.ascii	"LED_BLINK\000"
.LASF13:
	.ascii	"GPIO_CONFIG\000"
.LASF2:
	.ascii	"RCC_CFGR\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
