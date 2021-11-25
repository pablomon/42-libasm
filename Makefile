# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pmontese <pmontes@student.42madrid.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/25 17:49:57 by pmontese          #+#    #+#              #
#    Updated: 2021/11/25 17:51:22 by pmontese         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		=	ft_strlen.s ft_strcmp.s ft_strcpy.s ft_write.s ft_read.s ft_strdup.s
OBJS		=	$(SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-felf64
CC			=	gcc

NAME		=	libasm.a
MAIN		=	main

MAIN_SRC	=	main.c
MAIN_OBJ	=	$(MAIN_SRC:.c=.o)

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