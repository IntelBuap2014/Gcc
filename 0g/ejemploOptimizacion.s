	.file	"ejemploOptimizacion.c"
	.text
	.globl	funcion
	.type	funcion, @function
funcion:
.LFB24:
	.cfi_startproc
	movl	$0, %eax
	movsd	.LC0(%rip), %xmm1
	jmp	.L2
.L3:
	mulsd	%xmm0, %xmm1
	addl	$1, %eax
.L2:
	cmpl	%edi, %eax
	jb	.L3
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE24:
	.size	funcion, .-funcion
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"suma = %g\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movl	$0, %ebx
	xorpd	%xmm1, %xmm1
	movsd	%xmm1, 8(%rsp)
	movl	$-858993459, %ebp
	jmp	.L5
.L8:
	movl	%ebx, %eax
	mull	%ebp
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	movl	%ebx, %edi
	subl	%eax, %edi
	movl	%ebx, %eax
	cvtsi2sdq	%rax, %xmm0
	call	funcion
	addsd	8(%rsp), %xmm0
	movsd	%xmm0, 8(%rsp)
	addl	$1, %ebx
.L5:
	cmpl	$99999, %ebx
	jbe	.L8
	movsd	8(%rsp), %xmm0
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movl	$0, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu/Linaro 4.8.1-10ubuntu9) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
