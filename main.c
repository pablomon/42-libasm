#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

size_t		ft_strlen(char *str);
char		*ft_strcpy(char *dest, const char *src);
char		*ft_strdup(const char *s);
int			ft_strcmp(const char *s1, const char *s2);
ssize_t		ft_write(int fd, const void *buf, size_t count);
ssize_t		ft_read(int fd, void *buf, size_t count);

void	test_strlen()
{
	char	str[500];
	int		i;

	printf("'Hello world': strlen:%ld, ft_strlen:%ld\n", strlen("Hello world"), ft_strlen("Hello world"));
	printf("'': strlen:%ld, ft_strlen:%ld\n", strlen(""), ft_strlen(""));
	i = 0;
	while (i < 500)
	{	
		str[i] = 'b';
		if (i % 2 == 0)
			str[i] = 'a';
		i++;
	}
	str[i] = 0;
	printf("'%s': \nstrlen:%ld, ft_strlen:%ld\n", str, strlen(str), ft_strlen(str));
}

void	test_strcpy()
{
	char	src1[] = "a string";
	char	dst1[] = "12345678910";
	char	src2[] = "a longer string";
	char	dst2[] = "12345\0";
	int		len;

	printf("same length: (src = '%s', dst = '%s')\n", src1, dst1);
	strcpy(dst1, src1);
	printf("strcpy: %s\n", dst1);
	ft_strcpy(dst1, src1);
	printf("ft_strcpy: %s\n", dst1);
	printf("\n");

	printf("shorter dst: (src = '%s', dst = '%s')\n", src2, dst2);
	printf("strcpy: %s\n", strcpy(dst2, src2));
	printf("ft_strcpy: %s\n", ft_strcpy(dst2, src2));
	printf("\n");
}

void	test_strcmp()
{
	char	*s1;
	char	*s2;
	
	s1 = "";
	s2 = "";
	printf("('%s', '%s'): strcmp:%d, ft_strcmp:%d\n", s1, s2, strcmp(s1,s2), strcmp(s1,s2));
	s1 = "";
	s2 = "a string";
	printf("('%s', '%s'): strcmp:%d, ft_strcmp:%d\n", s1, s2, strcmp(s1,s2), strcmp(s1,s2));
	s1 = "a string";
	s2 = "";
	printf("('%s', '%s'): strcmp:%d, ft_strcmp:%d\n", s1, s2, strcmp(s1,s2), strcmp(s1,s2));
	s1 = "a string";
	s2 = "a string";
	printf("('%s', '%s'): strcmp:%d, ft_strcmp:%d\n", s1, s2, strcmp(s1,s2), strcmp(s1,s2));
	s1 = "1";
	s2 = "2";
	printf("('%s', '%s'): strcmp:%d, ft_strcmp:%d\n", s1, s2, strcmp(s1,s2), strcmp(s1,s2));
	s1 = "2";
	s2 = "1";
	printf("('%s', '%s'): strcmp:%d, ft_strcmp:%d\n", s1, s2, strcmp(s1,s2), strcmp(s1,s2));
	printf("\n");
}

void	test_write()
{
	char	*str;
	int		ret;
	int		fd;

	printf("writing to stdout\n");
	str = "It's a long story, to long to tell here.";
	printf("write '%s' to stdout\n", str);
	ret = write(1, str, strlen(str));
	printf("\nret: %d\n", ret);
	printf("ft_write '%s' to stdout\n", str);
	ret = ft_write(1, str, strlen(str));
	printf("\nret: %d\n", ret);

	printf("writing to a filedescriptor\n");
	fd = open("writen-from-test_write.txt", O_CREAT | O_WRONLY | O_APPEND, 0777);
	str = "You have a new message in your file\n";
	printf("write: 'You have a new message in your file\\n'\n" , str);
	ret = write(fd,str, strlen(str));
	printf("ret = %d, errno = %d\n", ret);
	printf("ft_write: 'You have a new message in your file\\n'\n" , str);
	ret = ft_write(fd,str, strlen(str));
	printf("ret = %d, errno = %d\n", ret);
	close(fd);

	printf("writing to a wrong fd (fd = -1)\n");
	printf("write: 'This won't work\\n'\n" , str);
	ret = write(-1,str, strlen(str));
	printf("ret = %d, errno = %d\n", ret, errno);
	printf("ft_write: 'This won't work\\n'\n" , str);
	ret = ft_write(-1,str, strlen(str));
	printf("ret = %d, errno = %d\n", ret, errno);
}

void	test_read()
{
	char		buf[100];
    int         fd;
    ssize_t     ret;

	printf("read file\n");
	printf("read : \n");
	fd = open("test.txt", O_RDONLY);
	ret = read(fd, buf, 100);
	buf[ret] = '\0';
	printf("buffer = %s\nret = %zd\n", buf, ret);
	printf("errno: %d\n", errno);
	close(fd);
	buf[0] = 0;
	printf("ft_read : \n");
	fd = open("test.txt", O_RDONLY);
	ret = ft_read(fd, buf, 100);
	buf[ret] = '\0';
	printf("buffer = %s\nret = %zd\n", buf, ret);
	printf("errno: %d\n", errno);
	close(fd);
	buf[0] = 0;
	printf("\n");

	printf("read error (fd = -1):\n");
	ret = read(-1, buf, 100);
	printf("read errno: %d\n", errno);
	ret = ft_read(-1, buf, 100);
	printf("ft_read errno: %d\n", errno);
	memset(buf, 0, 100);
	printf("\n");
	printf("write up to 100 characters (write):\n");
	ret = read(1, buf, 100);
	printf("buffer = %sret = %zd\n", buf, ret);
	memset(buf, 0, 100);
	printf("write up to 100 characters (ft_write):\n");
	ret = ft_read(1, buf, 100);
	printf("buffer = %sret = %zd\n", buf, ret);
}

int		main(void)
{
	// printf("\nTESTING LIBASM\n\n");
	// printf("1.\tFT_STRLEN\n");
	// test_strlen();
	// printf("2.\tFT_STRCPY\n");
	// test_strcpy();
	// printf("3.\tFT_STRCMP\n");
	// test_strcmp();
	printf("4.\tFT_WRITE\n");
	test_write();
	// printf("5.\tFT_READ\n");
	// test_read();
	return (0);
}