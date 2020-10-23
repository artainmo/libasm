; RDI takes the file descriptor fd
; RSI takes the second argument pointer on string
; RDX takes the third argument, number of bytes
; It prints its second argument on screen with bytes given as third argument
; To understand this code look at hello_world code above registers are automatically set to the right value

section	.text
						global	_ft_write:			; necessary for function call
						extern	_ft_strlen

_ft_write:
						push rdx			; Push rdx initial value so you can take it back later
						cmp rsi, 0		; Return error if the string is zero
						je	_ERROR
						mov       rax, 0x02000004         ; system call for write inside rax
						cmp rdx, 0					;If negative bytes return an error
						jl _ERROR						; If less than 0 jump to error
            mov		rdx, 0					;Test for errors, if error errno value 9 or 14 is returned, to not confuse with 14bytes written return we first syscall one
						syscall                           ; invoke operating system to do the write
  					cmp rax, 9					;If 9 is returned or errno value 9, the file descriptor is wrong and -1 should be returned
						je _ERROR
            pop rdx							;rdx takes back its inital value

_write:			mov	rax, 0x02000004         ; system call for write inside rax
            syscall                           ; invoke operating system to do the write, here we do the real write
            ret

_ERROR:
						pop rdx							;rdx takes back its inital value
						mov rax, -1
						ret
