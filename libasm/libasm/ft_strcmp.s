# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: artainmo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/27 11:15:17 by artainmo          #+#    #+#              #
#    Updated: 2020/01/27 11:15:20 by artainmo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; RDI takes the intial parameter s1
; RSI takes the second argument s2
; Returns the differnce in ascii value between the two last chars of the string that are equal to each other or /0

section	.text
global	_ft_strcmp:			; necessary for function call

_ft_strcmp:
						xor		RCX, RCX				; putting i at 0 with bitwise operand xor
						jmp		_compare			; go to compare section

_continue:
						inc		RCX					; increment the counter

_compare:
						mov		DL, BYTE [RSI + RCX] ; Put s2[i] inside a temporary to make the comparision
						cmp		BYTE [RDI + RCX], 0 ; If at end of string s1 stop while loop
            je    _ret                ; goto return if prior comparision is equal
            cmp		BYTE [RSI + RCX], 0 ; If at end of string s2 stop while loop
            je    _ret                ; goto return if prior comparision is equal
            cmp   BYTE [RDI + RCX], DL ; Compare if s1[i] is equal to s2[i]
						je		_continue			; if comparison is equal go to continue section

_ret:
						mov		BL, BYTE [RDI + RCX] ; To avoid changing the value of a particular byte we put it inside a temporary
						sub		BL, DL								; Substract s1[i] by s2[i] in ascii value
                        mov   AL, BL ; Because RAX is always returned we put s1[i] that should be returned inside RAX, AL equals the lowest 8bits of the RAX register
						ret						; return RAX
