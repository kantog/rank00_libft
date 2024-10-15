# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bclaeys <bclaeys@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/12 15:09:42 by bclaeys           #+#    #+#              #
#    Updated: 2024/05/02 14:38:58 by bclaeys          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Het enige dat je moet aanpassen zijn de volgende regels.
NAME=libft.a
TESTFILE=test
CODEDIRS=. # In welke directories staan onze code?. is huidige directory.
INCDIRS=. # Welke directories te checken voor .h files? 
# CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.c)) # Automatisch c-files zoeken. #DIT MOET HANDMATIG VOOR DE EVALUATIE
CFILES=ft_isdigit.c ft_memmove.c ft_strlen.c ft_toupper.c ft_bzero.c ft_isprint.c ft_memset.c ft_strncmp.c ft_isalnum.c ft_memchr.c ft_strchr.c ft_strnstr.c ft_isalpha.c ft_memcmp.c ft_strlcat.c ft_strrchr.c ft_isascii.c ft_memcpy.c ft_strlcpy.c ft_tolower.c ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c
BONUSFILES=ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c

OPT=-O0
CC=cc
# DEPFLAGS=-MP -MD # Genereer file die regels opmaken voor de .h dependencies.
CFLAGS=-Wall -Wextra -Werror -g 
# De for-loop hierboven parset de incdirs voor h files en voegt ze toe dmv -I.
OBJECTS=$(patsubst %.c,%.o,$(CFILES))
BONUS=$(patsubst %.c,%.o,$(BONUSFILES))
# Genereer alle .o's van CFILES.
# DEPFILES=$(patsubst %.c,%.d,$(CFILES)) 
# Genereer dependencies voor de .h files.

all: $(NAME)
	
$(NAME): $(OBJECTS)
	@ar rcs $@ $^
	@echo "Making libft.a"
	@echo "\033[33mArchive library libft.a created.\033[0m"

%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $<
# < Verwijst maar naar een enkele dependency.

test: $(NAME)
	$(CC) $(CFLAGS) -lbsd -o $(TESTFILE) $^
	@echo "\033[33mTest file created.\033[0m"
	@echo "\033[33mTest output:\033[0m"
	@eval ./test
	
clean:
	@rm -f $(OBJECTS) $(DEPFILES) $(TESTFILE)
	@echo "\033[33mAll object files, dependency files and test files removed.\033[0m"

fclean: clean
	@rm -f $(NAME)
	@echo "\033[33mArchive library removed.\033[0m"

re: fclean all

bonus: $(OBJECTS) $(BONUS)
	@ar rc $(NAME) $(OBJECTS) $(BONUS)
	@echo "\033[33mBonus files createds.\033[0m"

# -include $(DEPFILES)

.PHONY: all clean fclean re
