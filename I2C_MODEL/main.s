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
	.global	USART1
	.data
	.align	2
	.type	USART1, %object
	.size	USART1, 4
USART1:
	.word	1073811456
	.global	RCC
	.align	2
	.type	RCC, %object
	.size	RCC, 4
RCC:
	.word	1073887232
	.global	GPIOA
	.align	2
	.type	GPIOA, %object
	.size	GPIOA, 4
GPIOA:
	.word	1073872896
	.global	GPIOB
	.align	2
	.type	GPIOB, %object
	.size	GPIOB, 4
GPIOB:
	.word	1073873920
	.global	I2C1
	.align	2
	.type	I2C1, %object
	.size	I2C1, 4
I2C1:
	.word	1073763328
	.global	DMA2
	.align	2
	.type	DMA2, %object
	.size	DMA2, 4
DMA2:
	.word	1073898496
	.global	mystr
	.align	2
	.type	mystr, %object
	.size	mystr, 12
mystr:
	.ascii	"school of\015\012\000"
	.global	str
	.align	2
	.type	str, %object
	.size	str, 8
str:
	.ascii	"linux\015\012\000"
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
	.loc 1 138 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 140 16
	movs	r3, #0
	strb	r3, [r7, #7]
	.loc 1 142 15
	ldr	r0, .L3
	bl	strlen
	mov	r3, r0
	.loc 1 142 10
	str	r3, [r7, #12]
	.loc 1 143 15
	ldr	r0, .L3+4
	bl	strlen
	mov	r3, r0
	.loc 1 143 10
	str	r3, [r7, #8]
	.loc 1 145 6
	bl	RCC_CONFIG
	.loc 1 146 6
	bl	GPIO_CONFIG
	.loc 1 148 3
	bl	i2c1_init
	.loc 1 150 3
	adds	r2, r7, #7
	movs	r3, #1
	movs	r1, #107
	movs	r0, #208
	bl	i2c1_write
	.loc 1 151 6
	adds	r2, r7, #7
	movs	r3, #1
	movs	r1, #117
	movs	r0, #208
	bl	i2c1_read
.L2:
	.loc 1 153 11 discriminator 1
	b	.L2
.L4:
	.align	2
.L3:
	.word	mystr
	.word	str
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
	.loc 1 159 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #4
	str	r2, [r3, #48]
	.loc 1 160 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #2
	str	r2, [r3, #48]
	.loc 1 161 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #48]
	.loc 1 163 15
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L7
	ldr	r3, [r3]
	bic	r2, r2, #65536
	str	r2, [r3]
	.loc 1 164 15
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #65536
	str	r2, [r3]
	.loc 1 165 12
	nop
.L6:
	.loc 1 165 17 discriminator 1
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 165 22 discriminator 1
	and	r3, r3, #131072
	.loc 1 165 12 discriminator 1
	cmp	r3, #0
	beq	.L6
	.loc 1 167 17
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L7
	ldr	r3, [r3]
	bic	r2, r2, #3
	str	r2, [r3, #8]
	.loc 1 168 17
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3, #8]
	.loc 1 169 12
	nop
	.loc 1 171 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #68]
	.loc 1 173 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #64]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #131072
	str	r2, [r3, #64]
	.loc 1 175 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #68]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #16
	str	r2, [r3, #68]
	.loc 1 177 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #2097152
	str	r2, [r3, #48]
	.loc 1 179 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #48]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #4194304
	str	r2, [r3, #48]
	.loc 1 181 20
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, [r3, #64]
	ldr	r3, .L7
	ldr	r3, [r3]
	orr	r2, r2, #2097152
	str	r2, [r3, #64]
	.loc 1 183 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L8:
	.align	2
.L7:
	.word	RCC
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
	.loc 1 186 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 187 21
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3]
	.loc 1 188 21
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10
	ldr	r3, [r3]
	orr	r2, r2, #160
	str	r2, [r3]
	.loc 1 190 22
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #4
	str	r2, [r3, #4]
	.loc 1 192 21
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #240
	str	r2, [r3, #12]
	.loc 1 194 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #3840
	str	r2, [r3, #32]
	.loc 1 195 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	orr	r2, r2, #1792
	str	r2, [r3, #32]
	.loc 1 197 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3, #32]
	.loc 1 198 20
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r3, [r3]
	orr	r2, r2, #28672
	str	r2, [r3, #32]
	.loc 1 201 21
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3]
	.loc 1 202 21
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #40960
	str	r2, [r3]
	.loc 1 204 22
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #192
	str	r2, [r3, #4]
	.loc 1 206 21
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #61440
	str	r2, [r3, #12]
	.loc 1 208 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #251658240
	str	r2, [r3, #32]
	.loc 1 209 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #67108864
	str	r2, [r3, #32]
	.loc 1 211 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	bic	r2, r2, #-268435456
	str	r2, [r3, #32]
	.loc 1 212 20
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3, #32]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #1073741824
	str	r2, [r3, #32]
	.loc 1 213 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L11:
	.align	2
.L10:
	.word	GPIOA
	.word	GPIOB
	.cfi_endproc
.LFE2:
	.size	GPIO_CONFIG, .-GPIO_CONFIG
	.align	1
	.global	i2c1_init
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_init, %function
i2c1_init:
.LFB3:
	.loc 1 216 2
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 219 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #32768
	str	r2, [r3]
	.loc 1 221 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #8192
	str	r2, [r3]
	.loc 1 223 16
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3]
	.loc 1 225 16
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #2048
	str	r2, [r3]
	.loc 1 227 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #128
	str	r2, [r3]
	.loc 1 229 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #64
	str	r2, [r3]
	.loc 1 231 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #32
	str	r2, [r3]
	.loc 1 233 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #16
	str	r2, [r3]
	.loc 1 235 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3]
	.loc 1 237 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #2
	str	r2, [r3]
	.loc 1 239 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #2048
	str	r2, [r3, #4]
	.loc 1 241 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L13
	ldr	r3, [r3]
	bic	r2, r2, #63
	str	r2, [r3, #4]
	.loc 1 242 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #25
	str	r2, [r3, #4]
	.loc 1 244 13
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 244 19
	movs	r2, #125
	str	r2, [r3, #28]
	.loc 1 246 13
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 246 21
	movs	r2, #24
	str	r2, [r3, #32]
	.loc 1 248 19
	ldr	r3, .L13
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 249 3
	nop
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
	.word	I2C1
	.cfi_endproc
.LFE3:
	.size	i2c1_init, .-i2c1_init
	.align	1
	.global	i2c1_write
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_write, %function
i2c1_write:
.LFB4:
	.loc 1 252 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r2, [r7]
	mov	r2, r3
	mov	r3, r0
	strb	r3, [r7, #7]
	mov	r3, r1
	strb	r3, [r7, #6]
	mov	r3, r2
	strb	r3, [r7, #5]
	.loc 1 255 16
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L22
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 257 11
	nop
.L16:
	.loc 1 257 18 discriminator 1
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 257 24 discriminator 1
	and	r3, r3, #1
	.loc 1 257 11 discriminator 1
	cmp	r3, #0
	beq	.L16
	.loc 1 258 16
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 258 10
	str	r3, [r7, #12]
	.loc 1 260 10
	ldr	r3, .L22
	ldr	r3, [r3]
	.loc 1 260 15
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 262 11
	nop
.L17:
	.loc 1 262 18 discriminator 1
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 262 24 discriminator 1
	and	r3, r3, #130
	.loc 1 262 11 discriminator 1
	cmp	r3, #0
	beq	.L17
	.loc 1 263 16
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 263 10
	str	r3, [r7, #12]
	.loc 1 265 10
	ldr	r3, .L22
	ldr	r3, [r3]
	.loc 1 265 15
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 267 11
	nop
.L18:
	.loc 1 267 18 discriminator 1
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 267 24 discriminator 1
	and	r3, r3, #128
	.loc 1 267 11 discriminator 1
	cmp	r3, #0
	beq	.L18
	.loc 1 268 16
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 268 10
	str	r3, [r7, #12]
	.loc 1 270 8
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 270 3
	b	.L19
.L21:
	.loc 1 273 19
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	add	r3, r3, r2
	ldrb	r2, [r3]	@ zero_extendqisi2
	.loc 1 273 8
	ldr	r3, .L22
	ldr	r3, [r3]
	.loc 1 273 13
	str	r2, [r3, #16]
	.loc 1 275 18
	nop
.L20:
	.loc 1 275 25 discriminator 1
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 275 31 discriminator 1
	and	r3, r3, #128
	.loc 1 275 18 discriminator 1
	cmp	r3, #0
	beq	.L20
	.loc 1 276 14 discriminator 2
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 276 8 discriminator 2
	str	r3, [r7, #12]
	.loc 1 270 24 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L19:
	.loc 1 270 13 discriminator 1
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	ldr	r3, [r7, #8]
	.loc 1 270 3 discriminator 1
	cmp	r2, r3
	bhi	.L21
	.loc 1 279 16
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L22
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3]
	.loc 1 281 1
	nop
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L23:
	.align	2
.L22:
	.word	I2C1
	.cfi_endproc
.LFE4:
	.size	i2c1_write, .-i2c1_write
	.align	1
	.global	i2c1_read
	.syntax unified
	.thumb
	.thumb_func
	.type	i2c1_read, %function
i2c1_read:
.LFB5:
	.loc 1 284 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r2, [r7]
	mov	r2, r3
	mov	r3, r0
	strb	r3, [r7, #7]
	mov	r3, r1
	strb	r3, [r7, #6]
	mov	r3, r2
	strb	r3, [r7, #5]
	.loc 1 287 17
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L36
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 289 12
	nop
.L25:
	.loc 1 289 19 discriminator 1
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 289 25 discriminator 1
	and	r3, r3, #1
	.loc 1 289 12 discriminator 1
	cmp	r3, #0
	beq	.L25
	.loc 1 290 17
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 290 11
	str	r3, [r7, #12]
	.loc 1 292 10
	ldr	r3, .L36
	ldr	r3, [r3]
	.loc 1 292 15
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 294 12
	nop
.L26:
	.loc 1 294 19 discriminator 1
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 294 25 discriminator 1
	and	r3, r3, #130
	.loc 1 294 12 discriminator 1
	cmp	r3, #0
	beq	.L26
	.loc 1 295 19
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 295 13
	str	r3, [r7, #12]
	.loc 1 297 13
	ldr	r3, .L36
	ldr	r3, [r3]
	.loc 1 297 18
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	str	r2, [r3, #16]
	.loc 1 299 14
	nop
.L27:
	.loc 1 299 21 discriminator 1
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 299 27 discriminator 1
	and	r3, r3, #128
	.loc 1 299 14 discriminator 1
	cmp	r3, #0
	beq	.L27
	.loc 1 300 19
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 300 13
	str	r3, [r7, #12]
	.loc 1 302 19
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L36
	ldr	r3, [r3]
	orr	r2, r2, #256
	str	r2, [r3]
	.loc 1 304 14
	nop
.L28:
	.loc 1 304 21 discriminator 1
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 304 27 discriminator 1
	and	r3, r3, #1
	.loc 1 304 14 discriminator 1
	cmp	r3, #0
	beq	.L28
	.loc 1 305 19
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 305 13
	str	r3, [r7, #12]
	.loc 1 308 29
	ldrb	r3, [r7, #7]
	orr	r3, r3, #1
	uxtb	r2, r3
	.loc 1 308 13
	ldr	r3, .L36
	ldr	r3, [r3]
	.loc 1 308 18
	str	r2, [r3, #16]
	.loc 1 310 11
	nop
.L29:
	.loc 1 310 18 discriminator 1
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 310 24 discriminator 1
	and	r3, r3, #130
	.loc 1 310 11 discriminator 1
	cmp	r3, #0
	beq	.L29
	.loc 1 311 19
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 311 13
	str	r3, [r7, #12]
	.loc 1 313 10
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 313 5
	b	.L30
.L34:
	.loc 1 315 25
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	subs	r3, r3, #1
	mov	r2, r3
	.loc 1 315 16
	ldr	r3, [r7, #8]
	.loc 1 315 14
	cmp	r2, r3
	bne	.L31
	.loc 1 317 19
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L36
	ldr	r3, [r3]
	bic	r2, r2, #1024
	str	r2, [r3]
	b	.L35
.L31:
	.loc 1 319 30
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L36
	ldr	r3, [r3]
	orr	r2, r2, #1024
	str	r2, [r3]
.L35:
	.loc 1 321 17
	nop
.L33:
	.loc 1 321 24 discriminator 1
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	.loc 1 321 30 discriminator 1
	and	r3, r3, #64
	.loc 1 321 17 discriminator 1
	cmp	r3, #0
	beq	.L33
	.loc 1 322 16 discriminator 2
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	.loc 1 322 10 discriminator 2
	str	r3, [r7, #12]
	.loc 1 324 27 discriminator 2
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r1, [r3, #16]
	.loc 1 324 17 discriminator 2
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	add	r3, r3, r2
	.loc 1 324 21 discriminator 2
	uxtb	r2, r1
	strb	r2, [r3]
	.loc 1 313 26 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L30:
	.loc 1 313 15 discriminator 1
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	ldr	r3, [r7, #8]
	.loc 1 313 5 discriminator 1
	cmp	r2, r3
	bhi	.L34
	.loc 1 328 16
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L36
	ldr	r3, [r3]
	orr	r2, r2, #512
	str	r2, [r3]
	.loc 1 329 1
	nop
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L37:
	.align	2
.L36:
	.word	I2C1
	.cfi_endproc
.LFE5:
	.size	i2c1_read, .-i2c1_read
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6c0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF86
	.byte	0xc
	.4byte	.LASF87
	.4byte	.LASF88
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x4
	.4byte	0x2c
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.byte	0x4
	.4byte	0x4d
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x6
	.4byte	0x7d
	.4byte	0x94
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1c
	.byte	0x1
	.byte	0xa
	.byte	0x8
	.4byte	0xfb
	.uleb128 0x9
	.ascii	"SR\000"
	.byte	0x1
	.byte	0xc
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.ascii	"DR\000"
	.byte	0x1
	.byte	0xd
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x9
	.ascii	"BRR\000"
	.byte	0x1
	.byte	0xe
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0x9
	.ascii	"CR1\000"
	.byte	0x1
	.byte	0xf
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0x9
	.ascii	"CR2\000"
	.byte	0x1
	.byte	0x10
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0x9
	.ascii	"CR3\000"
	.byte	0x1
	.byte	0x11
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF11
	.byte	0x1
	.byte	0x12
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x1
	.byte	0x14
	.byte	0x11
	.4byte	0x10d
	.uleb128 0x5
	.byte	0x3
	.4byte	USART1
	.uleb128 0x5
	.byte	0x4
	.4byte	0x94
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x8c
	.byte	0x1
	.byte	0x16
	.byte	0x8
	.4byte	0x2e7
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x1
	.byte	0x18
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0x19
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1a
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0x9
	.ascii	"CIR\000"
	.byte	0x1
	.byte	0x1b
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1c
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1d
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1e
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x1
	.byte	0x1f
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF20
	.byte	0x1
	.byte	0x20
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x21
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.uleb128 0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x22
	.byte	0xf
	.4byte	0x2c
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x23
	.byte	0xf
	.4byte	0x2c
	.byte	0x2c
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x1
	.byte	0x24
	.byte	0xf
	.4byte	0x2c
	.byte	0x30
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x1
	.byte	0x25
	.byte	0xf
	.4byte	0x2c
	.byte	0x34
	.uleb128 0xa
	.4byte	.LASF26
	.byte	0x1
	.byte	0x26
	.byte	0xf
	.4byte	0x2c
	.byte	0x38
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x1
	.byte	0x27
	.byte	0xf
	.4byte	0x2c
	.byte	0x3c
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x1
	.byte	0x28
	.byte	0xf
	.4byte	0x2c
	.byte	0x40
	.uleb128 0xa
	.4byte	.LASF29
	.byte	0x1
	.byte	0x29
	.byte	0xf
	.4byte	0x2c
	.byte	0x44
	.uleb128 0xa
	.4byte	.LASF30
	.byte	0x1
	.byte	0x2a
	.byte	0xf
	.4byte	0x2c
	.byte	0x48
	.uleb128 0xa
	.4byte	.LASF31
	.byte	0x1
	.byte	0x2b
	.byte	0xf
	.4byte	0x2c
	.byte	0x4c
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x1
	.byte	0x2c
	.byte	0xf
	.4byte	0x2c
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x1
	.byte	0x2d
	.byte	0xf
	.4byte	0x2c
	.byte	0x54
	.uleb128 0xa
	.4byte	.LASF34
	.byte	0x1
	.byte	0x2e
	.byte	0xf
	.4byte	0x2c
	.byte	0x58
	.uleb128 0xa
	.4byte	.LASF35
	.byte	0x1
	.byte	0x2f
	.byte	0xf
	.4byte	0x2c
	.byte	0x5c
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x1
	.byte	0x30
	.byte	0xf
	.4byte	0x2c
	.byte	0x60
	.uleb128 0xa
	.4byte	.LASF37
	.byte	0x1
	.byte	0x31
	.byte	0xf
	.4byte	0x2c
	.byte	0x64
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x1
	.byte	0x32
	.byte	0xf
	.4byte	0x2c
	.byte	0x68
	.uleb128 0xa
	.4byte	.LASF39
	.byte	0x1
	.byte	0x33
	.byte	0xf
	.4byte	0x2c
	.byte	0x6c
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x1
	.byte	0x34
	.byte	0xf
	.4byte	0x2c
	.byte	0x70
	.uleb128 0x9
	.ascii	"CSR\000"
	.byte	0x1
	.byte	0x35
	.byte	0xf
	.4byte	0x2c
	.byte	0x74
	.uleb128 0xa
	.4byte	.LASF41
	.byte	0x1
	.byte	0x36
	.byte	0xf
	.4byte	0x2c
	.byte	0x78
	.uleb128 0xa
	.4byte	.LASF42
	.byte	0x1
	.byte	0x37
	.byte	0xf
	.4byte	0x2c
	.byte	0x7c
	.uleb128 0xa
	.4byte	.LASF43
	.byte	0x1
	.byte	0x38
	.byte	0xf
	.4byte	0x2c
	.byte	0x80
	.uleb128 0xa
	.4byte	.LASF44
	.byte	0x1
	.byte	0x39
	.byte	0xf
	.4byte	0x2c
	.byte	0x84
	.uleb128 0xa
	.4byte	.LASF45
	.byte	0x1
	.byte	0x3a
	.byte	0xf
	.4byte	0x2c
	.byte	0x88
	.byte	0
	.uleb128 0xc
	.ascii	"RCC\000"
	.byte	0x1
	.byte	0x3c
	.byte	0xf
	.4byte	0x2f9
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC
	.uleb128 0x5
	.byte	0x4
	.4byte	0x113
	.uleb128 0x8
	.4byte	.LASF47
	.byte	0x28
	.byte	0x1
	.byte	0x3e
	.byte	0x8
	.4byte	0x38f
	.uleb128 0xa
	.4byte	.LASF48
	.byte	0x1
	.byte	0x41
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF49
	.byte	0x1
	.byte	0x42
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF50
	.byte	0x1
	.byte	0x43
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF51
	.byte	0x1
	.byte	0x44
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0x9
	.ascii	"IDR\000"
	.byte	0x1
	.byte	0x45
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0x9
	.ascii	"ODR\000"
	.byte	0x1
	.byte	0x46
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF52
	.byte	0x1
	.byte	0x47
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF53
	.byte	0x1
	.byte	0x48
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x1
	.byte	0x49
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF55
	.byte	0x1
	.byte	0x4a
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.byte	0
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x1
	.byte	0x4c
	.byte	0x10
	.4byte	0x3a1
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOA
	.uleb128 0x5
	.byte	0x4
	.4byte	0x2ff
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x1
	.byte	0x4d
	.byte	0x10
	.4byte	0x3a1
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB
	.uleb128 0x8
	.4byte	.LASF58
	.byte	0x28
	.byte	0x1
	.byte	0x50
	.byte	0x8
	.4byte	0x448
	.uleb128 0x9
	.ascii	"CR1\000"
	.byte	0x1
	.byte	0x52
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0x9
	.ascii	"CR2\000"
	.byte	0x1
	.byte	0x53
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF59
	.byte	0x1
	.byte	0x54
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF60
	.byte	0x1
	.byte	0x55
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0x9
	.ascii	"DR\000"
	.byte	0x1
	.byte	0x56
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0x9
	.ascii	"SR1\000"
	.byte	0x1
	.byte	0x57
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.uleb128 0x9
	.ascii	"SR2\000"
	.byte	0x1
	.byte	0x58
	.byte	0xf
	.4byte	0x2c
	.byte	0x18
	.uleb128 0x9
	.ascii	"CCR\000"
	.byte	0x1
	.byte	0x59
	.byte	0xf
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF61
	.byte	0x1
	.byte	0x5a
	.byte	0xf
	.4byte	0x2c
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF62
	.byte	0x1
	.byte	0x5b
	.byte	0xf
	.4byte	0x2c
	.byte	0x24
	.byte	0
	.uleb128 0xb
	.4byte	.LASF63
	.byte	0x1
	.byte	0x5e
	.byte	0xf
	.4byte	0x45a
	.uleb128 0x5
	.byte	0x3
	.4byte	I2C1
	.uleb128 0x5
	.byte	0x4
	.4byte	0x3b9
	.uleb128 0x8
	.4byte	.LASF64
	.byte	0x18
	.byte	0x1
	.byte	0x60
	.byte	0x8
	.4byte	0x4bb
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x1
	.byte	0x63
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF65
	.byte	0x1
	.byte	0x64
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x9
	.ascii	"PAR\000"
	.byte	0x1
	.byte	0x65
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF66
	.byte	0x1
	.byte	0x66
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF67
	.byte	0x1
	.byte	0x67
	.byte	0xf
	.4byte	0x2c
	.byte	0x10
	.uleb128 0x9
	.ascii	"FCR\000"
	.byte	0x1
	.byte	0x68
	.byte	0xf
	.4byte	0x2c
	.byte	0x14
	.byte	0
	.uleb128 0x8
	.4byte	.LASF68
	.byte	0xd0
	.byte	0x1
	.byte	0x6c
	.byte	0x8
	.4byte	0x508
	.uleb128 0xa
	.4byte	.LASF69
	.byte	0x1
	.byte	0x6f
	.byte	0xf
	.4byte	0x2c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF70
	.byte	0x1
	.byte	0x70
	.byte	0xf
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF71
	.byte	0x1
	.byte	0x71
	.byte	0xf
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF72
	.byte	0x1
	.byte	0x72
	.byte	0xf
	.4byte	0x2c
	.byte	0xc
	.uleb128 0x9
	.ascii	"S\000"
	.byte	0x1
	.byte	0x73
	.byte	0x16
	.4byte	0x508
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.4byte	0x460
	.4byte	0x518
	.uleb128 0x7
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0xb
	.4byte	.LASF73
	.byte	0x1
	.byte	0x75
	.byte	0xf
	.4byte	0x52a
	.uleb128 0x5
	.byte	0x3
	.4byte	DMA2
	.uleb128 0x5
	.byte	0x4
	.4byte	0x4bb
	.uleb128 0x6
	.4byte	0x7d
	.4byte	0x540
	.uleb128 0x7
	.4byte	0x2c
	.byte	0xb
	.byte	0
	.uleb128 0xb
	.4byte	.LASF74
	.byte	0x1
	.byte	0x87
	.byte	0x6
	.4byte	0x530
	.uleb128 0x5
	.byte	0x3
	.4byte	mystr
	.uleb128 0xc
	.ascii	"str\000"
	.byte	0x1
	.byte	0x88
	.byte	0x6
	.4byte	0x84
	.uleb128 0x5
	.byte	0x3
	.4byte	str
	.uleb128 0xd
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x11b
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5da
	.uleb128 0xe
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x11b
	.byte	0x1e
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0xe
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x11b
	.byte	0x35
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0xe
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x11b
	.byte	0x4d
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x11b
	.byte	0x60
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0xf
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x11d
	.byte	0x1d
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x11d
	.byte	0x21
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x10
	.4byte	.LASF80
	.byte	0x1
	.byte	0xfb
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x649
	.uleb128 0x11
	.4byte	.LASF75
	.byte	0x1
	.byte	0xfb
	.byte	0x1f
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x11
	.4byte	.LASF76
	.byte	0x1
	.byte	0xfb
	.byte	0x36
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x1
	.byte	0xfb
	.byte	0x4e
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF78
	.byte	0x1
	.byte	0xfb
	.byte	0x61
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0x12
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xfd
	.byte	0x1c
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0x1
	.byte	0xfd
	.byte	0x20
	.4byte	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x13
	.4byte	.LASF81
	.byte	0x1
	.byte	0xd7
	.byte	0x7
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF82
	.byte	0x1
	.byte	0xb9
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF83
	.byte	0x1
	.byte	0x9d
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF89
	.byte	0x1
	.byte	0x89
	.byte	0x5
	.4byte	0x25
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.ascii	"var\000"
	.byte	0x1
	.byte	0x8c
	.byte	0x10
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x15
	.4byte	.LASF84
	.byte	0x1
	.byte	0x8e
	.byte	0xa
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF85
	.byte	0x1
	.byte	0x8f
	.byte	0xa
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x2
	.uleb128 0x18
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
.LASF36:
	.ascii	"APB1LPENR\000"
.LASF53:
	.ascii	"LCKR\000"
.LASF66:
	.ascii	"M0AR\000"
.LASF49:
	.ascii	"OTYPER\000"
.LASF61:
	.ascii	"TRISE\000"
.LASF47:
	.ascii	"GPIO_s\000"
.LASF48:
	.ascii	"MODER\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF51:
	.ascii	"PUPDR\000"
.LASF32:
	.ascii	"AHB1LPENR\000"
.LASF45:
	.ascii	"DCKCFGR\000"
.LASF1:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF75:
	.ascii	"dev_addr\000"
.LASF52:
	.ascii	"BSRR\000"
.LASF16:
	.ascii	"AHB1RSTR\000"
.LASF11:
	.ascii	"GTPR\000"
.LASF78:
	.ascii	"n_bytes\000"
.LASF76:
	.ascii	"reg_addr\000"
.LASF7:
	.ascii	"long int\000"
.LASF21:
	.ascii	"APB2RSTR\000"
.LASF83:
	.ascii	"RCC_CONFIG\000"
.LASF13:
	.ascii	"RCC_s\000"
.LASF62:
	.ascii	"FLTR\000"
.LASF14:
	.ascii	"PLLCFGR\000"
.LASF85:
	.ascii	"byte\000"
.LASF50:
	.ascii	"OSPEEDR\000"
.LASF63:
	.ascii	"I2C1\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF74:
	.ascii	"mystr\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF77:
	.ascii	"data\000"
.LASF84:
	.ascii	"size\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF44:
	.ascii	"PLLI2SCFGR\000"
.LASF12:
	.ascii	"USART_s\000"
.LASF87:
	.ascii	"main.c\000"
.LASF70:
	.ascii	"HISR\000"
.LASF58:
	.ascii	"I2C_s\000"
.LASF37:
	.ascii	"APB2LPENR\000"
.LASF73:
	.ascii	"DMA2\000"
.LASF64:
	.ascii	"DMA_STREAM_s\000"
.LASF71:
	.ascii	"LIFCR\000"
.LASF86:
	.ascii	"GNU C17 10.3.1 20210824 (release) -mcpu=cortex-m4 -"
	.ascii	"mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -march=ar"
	.ascii	"mv7e-m+fp -g\000"
.LASF35:
	.ascii	"reserved10\000"
.LASF2:
	.ascii	"long double\000"
.LASF39:
	.ascii	"reserved12\000"
.LASF41:
	.ascii	"reserved13\000"
.LASF42:
	.ascii	"reserved14\000"
.LASF82:
	.ascii	"GPIO_CONFIG\000"
.LASF33:
	.ascii	"AHB2LPENR\000"
.LASF20:
	.ascii	"APB1RSTR\000"
.LASF56:
	.ascii	"GPIOA\000"
.LASF57:
	.ascii	"GPIOB\000"
.LASF55:
	.ascii	"AFRH\000"
.LASF54:
	.ascii	"AFRL\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"short int\000"
.LASF68:
	.ascii	"DMA_s\000"
.LASF79:
	.ascii	"i2c1_read\000"
.LASF29:
	.ascii	"APB2ENR\000"
.LASF88:
	.ascii	"/home/linux/Documents/STM/STM32F401CC/I2C_MODEL\000"
.LASF10:
	.ascii	"char\000"
.LASF17:
	.ascii	"AHB2RSTR\000"
.LASF65:
	.ascii	"NDTR\000"
.LASF80:
	.ascii	"i2c1_write\000"
.LASF28:
	.ascii	"APB1ENR\000"
.LASF40:
	.ascii	"BDCR\000"
.LASF25:
	.ascii	"AHB2ENR\000"
.LASF67:
	.ascii	"M1AR\000"
.LASF43:
	.ascii	"SSCGR\000"
.LASF22:
	.ascii	"reserved3\000"
.LASF38:
	.ascii	"reserved11\000"
.LASF81:
	.ascii	"i2c1_init\000"
.LASF59:
	.ascii	"OAR1\000"
.LASF60:
	.ascii	"OAR2\000"
.LASF24:
	.ascii	"AHB1ENR\000"
.LASF15:
	.ascii	"CFGR\000"
.LASF18:
	.ascii	"reserved1\000"
.LASF19:
	.ascii	"reserved2\000"
.LASF46:
	.ascii	"USART1\000"
.LASF23:
	.ascii	"reserved4\000"
.LASF26:
	.ascii	"reserved5\000"
.LASF27:
	.ascii	"reserved6\000"
.LASF30:
	.ascii	"reserved7\000"
.LASF31:
	.ascii	"reserved8\000"
.LASF34:
	.ascii	"reserved9\000"
.LASF89:
	.ascii	"main\000"
.LASF72:
	.ascii	"HIFCR\000"
.LASF69:
	.ascii	"LISR\000"
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
