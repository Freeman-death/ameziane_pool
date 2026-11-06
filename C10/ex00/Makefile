CC = gcc
CFLAGS = -Wall -Wextra -Werror
TARGET = ft_display_file
SRC = ft_display_file.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)

fclean: clean

re: fclean all

.PHONY: all clean fclean re
