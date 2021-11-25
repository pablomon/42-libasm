SRCS		=	ft_strlen.s ft_strcmp.s ft_strcpy.s ft_write.s ft_read.s ft_strdup.s
OBJS		=	$(SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-felf64
CC			=	clang
#FLAGS 		=	-Wall -Werror -Wextra -lasm -L.
CFLAGS		=	-lasm -L.
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
				rm -rf $(NAME) $(MAIN)

re:				fclean $(NAME)

main:			$(MAIN_OBJ)
				make
				$(CC) $(CFLAGS) -o $(MAIN) $(MAIN_OBJ)
				./$(MAIN)

.PHONY:			clean fclean re test bonus test_bonus