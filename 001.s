	# Assembly skeleton generated using a basic C file and gcc.
    # Run on 32-bit macbook pro 10.9.2
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_mult
	.align	4, 0x90
_divByThreeOrFive:   
	pushq	%rbp
	movq	%rsp, %rbp

	movl    %edi, %ecx  # Copy for divide by 5.

	movl	%edi, %eax  # %edi contains arg 1.
	cltd                # Sign extend into %edx.

	movl  $3, %esi
	idivl %esi       # Divide by 3.
                     # Quotient in %eax, remainder in %edx.

	cmpl   $0, %edx       # See if remainder 0.
	sete   %al            # Set low byte of %eax to 1 or 0.
	movzbl %al, %eax      # Set remaining bits to zero in eax.
	je     .divExit       # Exit early if divisible by three.


	movl %ecx, %eax       # Set up division.
	cltd

	movl   $5, %esi
	idivl  %esi
	cmpl   $0, %edx
	sete   %al
	movzbl %al, %eax
	je     .divExit      # Same as above. Return result.

.divExit:
	popq	%rbp
	ret

	.globl	_main
	.align	4, 0x90
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp

	movl    $0, %ebx  # Our total.
	movl    $2, %edi  # Current num to test.
                      # Start at 2 since we increment on entrace of main loop.
	jmp     .mainLoop

.mainLoop:
	inc     %edi
	cmpl    $999, %edi          # While %edi <= 999.
	jg      .mainExit           # End of loop.
	callq	_divByThreeOrFive
	cmpl    $0, %eax
	je      .mainLoop           # Next loop if not divisible.
	addl    %edi, %ebx          # Increment total. 
	jmp     .mainLoop


.mainExit:
	leaq	L_.str(%rip), %rdi
	movl	%ebx, %esi   # %esi contains integer arg to printf.
	movb	$0, %al
	callq	_printf

	movl	%eax, -16(%rbp)         ## 4-byte Spill
	movl	$0, %eax
	addq	$16, %rsp
	popq	%rbp
	ret

	.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	 "%d\n"


.subsections_via_symbols
