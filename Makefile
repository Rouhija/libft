# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: srouhe <srouhe@student.hive.fi>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/15 16:29:02 by srouhe            #+#    #+#              #
#    Updated: 2020/01/15 19:51:20 by srouhe           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a
HDRS	=	includes/
C 		=	gcc

FILES	=	ft_atoi.c \
			ft_bzero.c \
			ft_count_digits.c \
			ft_count_leading.c \
			ft_count_trailing.c \
			ft_endswith.c \
			ft_freestrarr.c \
		    ft_isalnum.c \
			ft_isalpha.c \
			ft_isascii.c \
			ft_isdigit.c \
			ft_isprint.c \
			ft_iswhitespace.c \
			ft_itoa_base.c \
		  	ft_itoa.c \
			ft_lfind.c \
			ft_lstadd.c \
			ft_lstdel.c \
			ft_lstdelone.c \
			ft_lstiter.c \
			ft_lstmap.c \
			ft_lstnew.c \
			ft_lstpushback.c \
			ft_memalloc.c \
			ft_memccpy.c \
			ft_memchr.c \
			ft_memcmp.c \
			ft_memcpy.c \
			ft_memdel.c \
		    ft_memdup.c \
			ft_memmove.c \
			ft_memset.c \
			ft_pathjoin.c \
			ft_pow.c \
			ft_print_bits.c \
			ft_print_hex.c \
			ft_putchar_fd.c \
			ft_putchar_w.c \
			ft_putchar.c \
			ft_putendl_fd.c \
			ft_putendl.c \
			ft_putnbr_fd.c \
			ft_putnbr.c \
			ft_putnstr.c \
			ft_putstr_fd.c \
			ft_putstr_w.c \
			ft_putstr.c \
			ft_realloc.c \
			ft_rfind.c \
			ft_str_isempty.c \
			ft_str_replace.c \
     		ft_strcat.c \
			ft_strchr_len.c \
	    	ft_strchr.c \
			ft_strclr.c \
			ft_strcmp.c \
			ft_strcpy.c \
			ft_strdel.c \
			ft_strdup.c \
	    	ft_strequ.c \
			ft_striter.c \
			ft_striteri.c \
			ft_strjoin.c \
			ft_strlcat.c \
			ft_strlen.c \
	    	ft_strmap.c \
			ft_strmapi.c \
			ft_strncat.c \
			ft_strncmp.c \
			ft_strncpy.c \
			ft_strnequ.c \
	    	ft_strnew.c \
			ft_strnstr.c \
			ft_strrchr.c \
			ft_strrev.c \
			ft_strsplit.c \
			ft_strstr.c \
			ft_strsub.c \
	    	ft_strtrim.c \
			ft_strupper.c \
			ft_tolower.c \
			ft_toupper.c   		   

PTF		=	buffer.c \
			format_args.c \
			ft_printf.c \
			padding.c \
			parse_format.c \
			pop_stack.c \
			precision.c \
			utils.c

UTIL	=	c_regex.c \
			get_next_line.c

SRCS 	=	$(addprefix srcs/, $(FILES))
SPTF 	=	$(addprefix ptf/, $(PTF))
SUTL 	=	$(addprefix utils/, $(UTIL))
OBJS 	=	$(FILES:.c=.o)
OPTF 	=	$(PTF:.c=.o)
OUTL 	=	$(UTIL:.c=.o)

all: $(NAME)

$(NAME):
	@$(C) -Wall -Werror -Wextra -c $(SRCS) $(SPTF) $(SUTL) -I $(HDRS)
	@ar rc $(NAME) $(OBJS) $(OPTF) $(OUTL)
	@ranlib $(NAME)

clean:
	@/bin/rm -f $(OBJS) $(OPTF) $(OUTL)

fclean: clean
	@/bin/rm -f $(NAME)

re: fclean all

norm:
	norminette srcs/*.c
	norminette includes/*.h
	norminette ptf/*.c
	norminette util/*.c

test:
	gcc -c tester.c -I includes/
	gcc -Wall -Wextra -Werror *.o -I includes/ -L . -lft

clean_test:
	@/bin/rm -f tester.o
	@/bin/rm -f a.out

re_test: clean_test test

.PHONY: all
.PHONY: clean
.PHONY: fclean
.PHONY: re
.PHONY: norm
.PHONY: test
.PHONY: clean_test
.PHONY: re_test
