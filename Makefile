# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jebucoy <jebucoy@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/07 18:15:10 by jebucoy           #+#    #+#              #
#    Updated: 2022/11/10 22:44:54 by jebucoy          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC		= 	gcc

CFLAGS	= -Wall -Wextra -Werror -I ${HEADER}

RM	=	rm -rf

HEADER	=	inc

S_NAME	=	server

S_SRC	=	mandatory/server.c \

S_OBJS	=	$(S_SRC:.c=.o)

C_NAME	=	client

C_SRC	=	mandatory/client.c \

C_OBJS	=	$(C_SRC:.c=.o)

GREEN	=	\033[0;32m	\

RED		=	\033[0;31m	\

UTILS	=	utils/ft_atoi.c \
			utils/ft_putchar_fd.c \
			utils/ft_putnbr_fd.c \
			utils/ft_putstr_fd.c \
			utils/ft_strlen.c \

U_OBJS	=	$(UTILS:.c=.o)

SB_NAME	=	server

SB_SRC	=	bonus/server_bonus.c \

SB_OBJS	=	$(SB_SRC:.c=.o)

CB_NAME	=	client

CB_SRC	=	bonus/client_bonus.c \

CB_OBJS	=	$(CB_SRC:.c=.o)

all	:	$(U_OBJS) $(S_NAME) $(C_NAME)

bonus	: $(U_OBJS) $(SB_OBJS) $(CB_OBJS)
		$(CC) $(CFLAGS) $(SB_OBJS) $(U_OBJS) -o $(SB_NAME)
		@echo "$(GREEN)BONUS TIME: SERVER HAS BEEN CREATED"
		$(CC) $(CFLAGS) $(CB_OBJS) $(U_OBJS) -o $(CB_NAME)
		@echo "$(GREEN)BONUS TIME: CLIENT HAS BEEN CREATED"

$(S_NAME)	:	$(S_OBJS) $(U_OBJS)
				$(CC) $(CFLAGS) $(S_OBJS) $(U_OBJS) -o $(S_NAME)
				@echo "$(GREEN)Server has been created"

$(C_NAME)	:	$(C_OBJS) $(U_OBJS)
				$(CC) $(CFLAGS) $(C_OBJS) $(U_OBJS) -o $(C_NAME)
				@echo "$(GREEN)Client has been created"

clean	:	
		$(RM) $(S_OBJS) $(C_OBJS) $(U_OBJS) $(SB_OBJS) $(CB_OBJS)
		@echo "$(RED)Object files have been killed"

fclean	:	clean
		@$(RM) $(C_NAME) $(S_NAME) $(SB_NAME) $(CB_NAME)
		@echo "$(RED)Eexecutables have been wiped."

re		: fclean all


			

