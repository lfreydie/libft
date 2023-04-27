# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfreydie <lfreydie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/17 10:31:53 by lefreydier        #+#    #+#              #
#    Updated: 2023/04/27 11:06:50 by lfreydie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ---------- Project ---------- #

CC	=	cc
NAME	=	libft.a
CFLAGS	=	-Wall -Wextra -Werror
AR	=	ar -rcs

# ---------- Directories --------- #

HD_DIR = ./includes
SRC_DIR = ./src
OBJ_DIR = ./objs

# ------------ Delete ------------ #

RM = rm -f
RM_OPT = -r

# ------------ Colors ------------ #

GREEN=\033[0;32m
RED=\033[0;31m
PINK=\033[0;35m
BLUE=\033[0;34m
END=\033[0m

# ------------- Files ------------ #

# ------------ LIBFT ------------- #
SRC_F	+=	ft_atoi.c ft_bzero.c ft_isalnum.c ft_isalpha.c ft_tolower.c \
			ft_isascii.c ft_isdigit.c ft_isprint.c ft_memchr.c ft_memcpy.c \
			ft_memcmp.c ft_memset.c ft_strchr.c ft_strlcat.c ft_toupper.c \
			ft_strlcpy.c ft_strlen.c ft_strncmp.c ft_calloc.c ft_strrchr.c \
			ft_memmove.c ft_strdup.c ft_strnstr.c ft_strjoin.c ft_putchar_fd.c \
			ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_strmapi.c \
			ft_strtrim.c ft_substr.c ft_split.c ft_itoa.c ft_striteri.c
# --------- LIBFT BONUS ---------- #
SRC_F	+=	ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
			ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c \
			ft_lstiter.c ft_lstmap.c
# ------------ PRINTF ------------ #
SRC_F	+=	ft_i_utoa.c ft_print_ptr.c ft_printf.c ft_put_hex.c\
			ft_putchar.c ft_putnbr_u.c ft_putstr.c ft_strchr.c\
			ft_strlen.c
# -------- GET NEXT LINE --------- #
SRC_F	+=	get_next_line.c get_next_line_utils.c

SRC = $(addprefix $(SRC_DIR)/, $(SRC_F))
OBJ = $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(SRC:.c=.o))

# ----------- Compiles ----------- #

$(NAME) :	$(OBJ)
	@$(AR) $(NAME) $(OBJ)
	@echo "$(GREEN) ==== libft compiled ==== $(END)"

# ------------- Link ------------- #

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.c $(HD_DIR)
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -I $(HD_DIR) -c $< -o $@

# ------------- Rules ------------ #

all :	$(NAME)

clean :
	@$(RM) $(RM_OPT) $(OBJ_DIR)
	@echo "$(PINK) ==== All object removed ==== $(END)"

fclean :	clean
	@$(RM) $(NAME)
	@echo "$(RED) ==== Executables removed ==== $(END)"

re :	fclean all

.PHONY :	all clean fclean re
