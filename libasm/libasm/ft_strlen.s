# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: artainmo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/27 08:08:57 by artainmo          #+#    #+#              #
#    Updated: 2020/01/27 09:00:55 by artainmo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; RDI or r7 takes the intial parameter received, here the string first pointer
; RSI takes the second argument, RDX the third, RCX fourth, r8 fifth, r9 sixth
; The value in RAX is returned

section	.text
						global	_ft_strlen:			; necessary for function call
_ft_strlen:
						xor		RAX, RAX				; putting counter at 0 with bitwise operand xor
						jmp		_compare			; go to compare section

_continue:
						inc		RAX					; increment the counter

_compare:
						cmp		BYTE [RDI + RAX], 0	; compare specific byte with 0
						jne		_continue			; if comparison is wrong go to continue section

_ret:
						ret						; return i or RAX
