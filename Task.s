	.intel_syntax noprefix
	.text
	.local	A
	.comm	A,400,32
	.local	B
	.comm	B,400,32
	.section	.rodata
	.align 8
.LC0:
	.string	"Input array size (from 1 to 100), then input the elements: "
.LC1:
	.string	"%d"
	.align 8
.LC2:
	.string	"Wrong size. Termination of the program."
.LC3:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -12[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -12[rbp]
	test	eax, eax
	jle	.L2
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, 100
	jle	.L3
.L2:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L12
.L3:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L5
.L9:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	jle	.L6
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	DWORD PTR [rdx+rax], 1
	jmp	.L7
.L6:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	jns	.L8
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	DWORD PTR [rdx+rax], -1
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	DWORD PTR [rdx+rax], 0
.L7:
	add	DWORD PTR -4[rbp], 1
.L5:
	mov	eax, DWORD PTR -12[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L9
	mov	DWORD PTR -8[rbp], 0
	jmp	.L10
.L11:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -8[rbp], 1
.L10:
	mov	eax, DWORD PTR -12[rbp]
	cmp	DWORD PTR -8[rbp], eax
	jl	.L11
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
.L12:
	leave
	ret