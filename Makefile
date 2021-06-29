# Just to mess up with prod, fix .Makefile on final

TARGET = libftprint.a
LIBFT = libft

CC = gcc
CFLAGS = # -Wall -Wextra -Werror
AR = ar rcs
RM = rm -f

RAWSRC = printf
SRC =	$(addprefix ./ft_,	$(addsuffix	.c,	$(RAWSRC)))
OBJ =	$(SRC:%.c=%.o)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(TARGET): $(OBJ)
	make all -C $(LIBFT)/
	cp $(LIBFT)/$(LIBFT).a $(TARGET)
	$(AR) $@ $^
# $@ == curr. target. name
# $^ == curr. dependancy. list

all: $(TARGET)

clean:
	make clean -C $(LIBFT)
	$(RM) $(OBJ)

fclean: clean
	make fclean -C $(LIBFT)
	$(RM) $(TARGET)

re: fclean all

test: all
	$(CC) $(CFLAGS) -c -o main.o main.c
	$(CC) -o test.out -L. $(TARGET) main.o
	./test.out

.PHONY: all clean fclean re test bonus