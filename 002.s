.section	__TEXT,__text,regular,pure_instructions

.align 4, 0x90

isEven:
	pushq %rbp
	movq  %rsp, %rbp

	movl %edi, %eax  # Move arg into return reg.
	xor  $1,   %eax  # Set low bit if even.
	and  $1,   %eax  # Zero all but lowest.

	popq %rbp
	ret

.globl _main
.align 4, 0x90

_main:
	pushq %rbp
	movq  %rsp, %rbp
	subq  $16,  %rsp

	movl $2, %ebx # Total.

	movl $1, %edx # 1st in fib.
	movl $2, %ecx # 2nd in fib.
	jmp  .mainLoop

.mainLoop:
	movl %ecx, %esi
	addl %edx, %ecx # Calculate next in fib
	movl %esi, %edx

	cmpl $4000000, %ecx # Loop while less than 4_000_000
	jge  .endMain
	movl %ecx, %edi # Setup for function call.
	callq isEven
	cmpl $0, %eax
	je .mainLoop  # Don't add odd numbers to total.
	addl %ecx, %ebx
	jmp .mainLoop

.endMain:
	movl %ebx, %esi  # Load up answer to print.
	leaq L_.str(%rip), %rdi
	movb $0, %al
	callq _printf

	movl %eax, -16(%rbp)
	movl $0, %eax
	addq $16, %rsp
	popq %rbp
	ret

.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz "%d\n"
