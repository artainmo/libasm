# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: artainmo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/27 09:49:37 by artainmo          #+#    #+#              #
#    Updated: 2020/01/27 09:50:47 by artainmo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; RDI takes the intial parameter s1
; RSI takes the second argument s2
; s2 needs to be copied inside s1 and s1 should be returned

section	.text
						global	_ft_strcpy:			; necessary for function call

_ft_strcpy:
						xor		RCX, RCX				; putting i at 0 with bitwise operand xor
						jmp		_copy			; go to copy section

_continue:
						inc		RCX					; increment the counter

_copy:
						mov		DL, BYTE [RSI + RCX] ; DL contains 8bytes enough to store one char, CL is not used because i uses this 64byte or RCX
						mov		BYTE [RDI + RCX], DL ; We than compare DL or a specific RSI byte (you cannot directly compare two specific bytes in one command line that is why we use a temporary or DL)
						cmp		BYTE [RSI + RCX], 0
						jne		_continue			; if comparison is wrong go to continue section

_ret:
            mov   RAX, RDI  ; Because RAX is always returned we put s1 that should be returned inside RAX
						ret						; return RAX
