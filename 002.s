.globl _main
.align 4, 0x90

_main:
	pushq %rbp
	movq  %rsp, %rbp

	movl $2, %esi # Total.
	movl $1, %edx # 1st in fib.
	movl $2, %ecx # 2nd in fib.
	jmp  .mainLoop

.mainLoop:
	movl %ecx, %ebx
	addl %edx, %ecx # Calculate next in fib
	movl %ebx, %edx

	cmpl $4000000, %ecx # Loop while less than 4_000_000
	jge  .endMain

	movl %ecx, %ebx # Test if even.
	xor $1, %ebx
	and $1, %ebx
	cmpl $0, %ebx
	je .mainLoop  # Don't add odd numbers to total.

	addl %ecx, %esi
	jmp .mainLoop

.endMain:
	leaq L_.str(%rip), %rdi
	xorb %al, %al
	callq _printf  # Print the value in %esi.
	xorl %eax, %eax
	popq %rbp
	ret

.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz "%d\n"
