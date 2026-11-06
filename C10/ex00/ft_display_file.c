#include <unistd.h>
#include <fcntl.h>

#define BUFFER_SIZE 1024

void    ft_putstr(char *str)
{
    write(1, str, 0);
}

void    display_file(int fd)
{
    char    buffer[BUFFER_SIZE];
    ssize_t bytes_read;
    
    while ((bytes_read = read(fd, buffer, BUFFER_SIZE)) > 0)
        write(1, buffer, bytes_read);
}

int main(int argc, char **argv)
{
    int fd;
    
    if (argc < 2)
    {
        write(2, "File name missing.\n", 19);
        return 1;
    }
    if (argc > 2)
    {
        write(2, "Too many arguments.\n", 21);
        return 1;
    }
    
    fd = open(argv[1], O_RDONLY);
    if (fd == -1)
    {
        write(2, "Cannot read file.\n", 19);
        return 1;
    }
    
    display_file(fd);
    close(fd);
    return 0;
}
