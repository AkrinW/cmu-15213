	.file	"lab3.c"
	.text
.Ltext0:
	.file 0 "/root/cmu-15213/lab2_handout" "lab3.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"You are taking this class: %d %d \n"
	.text
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
.LFB0:
	.file 1 "lab3.c"
	.loc 1 9 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	.loc 1 10 9
	movl	-36(%rbp), %eax
	movl	%eax, -20(%rbp)
	.loc 1 11 7
	movl	-20(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 12 10
	movl	$40, -20(%rbp)
	.loc 1 14 5
	movl	$0, %eax
	call	helper_func@PLT
	movl	%eax, %ecx
	movl	-36(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 16 8
	cmpl	$1, -36(%rbp)
	jg	.L2
	.loc 1 17 16
	movl	-36(%rbp), %eax
	jmp	.L3
.L2:
	.loc 1 18 12
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	fibonacci
	movl	%eax, %ebx
	.loc 1 18 31
	movl	-36(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %edi
	call	fibonacci
	.loc 1 18 29
	addl	%ebx, %eax
.L3:
	.loc 1 19 1
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fibonacci, .-fibonacci
	.section	.rodata
.LC1:
	.string	"fib(%d) = %d\n"
	.align 8
.LC3:
	.string	"clocks ticks: %f \nTime in seconds taken by CPU: %f \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 22 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 23 21
	call	clock@PLT
	movq	%rax, -16(%rbp)
	.loc 1 24 9
	movl	$25, -24(%rbp)
	.loc 1 25 22
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	fibonacci
	movl	%eax, -20(%rbp)
	.loc 1 26 5
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 27 22
	movl	$2, -24(%rbp)
	.loc 1 29 13
	call	clock@PLT
	.loc 1 29 11
	subq	-16(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 30 33
	pxor	%xmm0, %xmm0
	cvtsi2sdq	-16(%rbp), %xmm0
	.loc 1 30 12
	movsd	.LC2(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	.loc 1 32 5
	pxor	%xmm2, %xmm2
	cvtsi2sdq	-16(%rbp), %xmm2
	movq	%xmm2, %rax
	movsd	-8(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 33 12
	movl	$0, %eax
	.loc 1 34 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1093567616
	.text
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
	.file 4 "/usr/include/time.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "lab3_helper.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x15f
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x5
	.long	.LASF20
	.byte	0xc
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x3
	.long	.LASF10
	.byte	0x2
	.byte	0x9c
	.byte	0x1b
	.long	0x5f
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x7
	.long	0x72
	.uleb128 0x3
	.long	.LASF11
	.byte	0x3
	.byte	0x7
	.byte	0x13
	.long	0x66
	.uleb128 0x8
	.byte	0x8
	.long	0x79
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.byte	0x48
	.byte	0x10
	.long	0x7e
	.uleb128 0xa
	.long	.LASF22
	.byte	0x5
	.value	0x164
	.byte	0xc
	.long	0x58
	.long	0xb4
	.uleb128 0xb
	.long	0x8a
	.uleb128 0x4
	.byte	0
	.uleb128 0xc
	.long	.LASF23
	.byte	0x6
	.byte	0x2
	.byte	0x5
	.long	0x58
	.long	0xc6
	.uleb128 0x4
	.byte	0
	.uleb128 0xd
	.long	.LASF17
	.byte	0x1
	.byte	0x15
	.byte	0x5
	.long	0x58
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x121
	.uleb128 0x2
	.long	.LASF12
	.byte	0x17
	.byte	0xd
	.long	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.long	.LASF13
	.byte	0x18
	.byte	0x9
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.long	.LASF14
	.byte	0x19
	.byte	0x9
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.long	.LASF15
	.byte	0x1e
	.byte	0xc
	.long	0x121
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.long	.LASF16
	.uleb128 0xe
	.long	.LASF18
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.long	0x58
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.string	"n"
	.byte	0x1
	.byte	0x8
	.byte	0x13
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.long	.LASF19
	.byte	0xa
	.byte	0x9
	.long	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x3
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.string	"unsigned int"
.LASF21:
	.string	"clock"
.LASF18:
	.string	"fibonacci"
.LASF23:
	.string	"helper_func"
.LASF15:
	.string	"time_taken_by_cpu"
.LASF20:
	.string	"GNU C99 11.4.0 -mtune=generic -march=x86-64 -g -O0 -std=c99 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF13:
	.string	"fibonacci_number"
.LASF9:
	.string	"char"
.LASF4:
	.string	"unsigned char"
.LASF17:
	.string	"main"
.LASF12:
	.string	"start"
.LASF8:
	.string	"long int"
.LASF2:
	.string	"long unsigned int"
.LASF16:
	.string	"double"
.LASF5:
	.string	"short unsigned int"
.LASF22:
	.string	"printf"
.LASF10:
	.string	"__clock_t"
.LASF19:
	.string	"fibs"
.LASF7:
	.string	"short int"
.LASF11:
	.string	"clock_t"
.LASF6:
	.string	"signed char"
.LASF14:
	.string	"fib_result"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/root/cmu-15213/lab2_handout"
.LASF0:
	.string	"lab3.c"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
