# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    c_hw.s                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: artainmo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/27 06:22:43 by artainmo          #+#    #+#              #
#    Updated: 2020/01/27 12:37:54 by artainmo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

;nasm -f macho64 hola.asm && gcc hola.o && ./a.out

global    _main
extern    _puts

section   .text
_main:    
push      rbx                     ; Call stack must be aligned
lea       rdi, [rel message]      ; First argument is address of message, rel prefix is required to access named variable
call      _puts                   ; puts(message)
pop       rbx                     ; Fix up stack before returning
ret

section   .data
message:  db        "Hola, mundo", 0        ; C strings need a zero byte at the end
