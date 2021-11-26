# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pmontese <pmontese@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/25 17:49:57 by pmontese          #+#    #+#              #
#    Updated: 2021/11/26 11:51:59 by pmontese         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		=	src/ft_strlen.s \
				src/ft_strcmp.s \
				src/ft_strcpy.s \
				src/ft_write.s \
				src/ft_read.s \
				src/ft_strdup.s

OBJS		=	$(SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-f macho64
CC			=	gcc

NAME		=	libasm.a

%.o:			%.s
				$(NA) $(NA_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)

clean:
				rm -rf $(OBJS)

fclean:			clean
				rm -rf $(NAME)

re:				fclean $(NAME)

.PHONY:			clean fclean re
