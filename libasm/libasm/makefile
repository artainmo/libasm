# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: artainmo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/09 21:50:42 by artainmo          #+#    #+#              #
#    Updated: 2020/02/12 02:48:38 by artainmo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC1 = \
        ft_strlen.s \
        ft_strcmp.s \
        ft_strcpy.s \
        ft_strdup.s \
				ft_write.s \
				ft_read.s
NAME = libasm.a
OBJS = $(SRC1:%.s=%.o)
NASM = nasm -f macho64
#macho64 is designed for 64 bit operating systems
RM = rm -rf
HEADER = ./

#nasm -f macho64 ft_strlen.s && gcc -Wall -Wextra -Werror ft_strlen.o main.c && ./a.out

all: $(NAME)

$(NAME):
	      nasm -f macho64 ft_strlen.s
				nasm -f macho64 ft_strcmp.s
				nasm -f macho64 ft_strcpy.s
				nasm -f macho64 ft_strdup.s
				nasm -f macho64 ft_write.s
				nasm -f macho64 ft_read.s
				ar rc $(NAME) $(OBJS)
	      ranlib $(NAME)
				gcc -Wall -Wextra -Werror $(NAME) main.c && ./a.out

clean:
	    $(RM) $(OBJS)

fclean: clean
	    $(RM) $(NAME)
			$(RM) ./a.out

re: fclean all

.PHONY: all test clean fclean re bonus
