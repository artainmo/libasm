#include "libasm.h"
#include <string.h>
#include <unistd.h>
//nasm -f macho64 ft_strlen.s && gcc -Wall -Wextra -Werror ft_strlen.o main.c && ./a.out

void		test_strlen(void)
{
	char	str[9] = "12345678";
	char	str2[2] = "a";
  char	str3[1] = "";

	printf("\n**Check ft_strlen**\n");
	printf("%s has size: %u\n", str, (unsigned int)ft_strlen(str));
	printf("%s has size: %u\n", str2, (unsigned int)ft_strlen(str2));
  printf("Empty string has size: %u\n", (unsigned int)ft_strlen(str3));
}

void		test_strcpy(void)
{
	char	str[9] = "12345678";
	char	str2[2] = "a";
  char	str3[1] = "";
  char  s[9];

	printf("\n**Check ft_strcpy**\n");
	printf("copy '%s' into: '%s'\n", str, ft_strcpy(s, str));
	printf("copy '%s' into: '%s'\n", str2, ft_strcpy(s, str2));
  printf("copy empty string into: '%s'\n", ft_strcpy(s, str3));
}

void		test_strcmp(void)
{
	char	str[9] = "12345678";
	char	str2[2] = "a";
  char	str3[5] = "1234";
  char  str4[9] = "12345678";

	printf("\n**Check ft_strcmp**\n");
	printf("comparison between %s and %s returns: %d\n", str, str2, ft_strcmp(str, str2));
	printf("Real function: %d\n", strcmp(str, str2));
	printf("comparison between %s and %s returns: %d\n", str, str3, ft_strcmp(str, str3));
	printf("Real function: %d\n", strcmp(str, str3));
  printf("comparison between %s and %s returns: %d\n", str, str4, ft_strcmp(str, str4));
	printf("Real function: %d\n", strcmp(str, str4));
	printf("comparison between %s and %s returns: %d\n", "", "", ft_strcmp("", ""));
	printf("Real function: %d\n", strcmp("", ""));
	printf("comparison between %s and %s returns: %d\n", "AAAAAAAAAB", "AAAAAAAAAC", ft_strcmp("AAAAAAAAAB", "AAAAAAAAC"));
	printf("Real function: %d\n", strcmp("AAAAAAAAAB", "AAAAAAAAC"));
	printf("comparison between %s and %s returns: %d\n", "", "AAAAAA", ft_strcmp("", "AAAAAA"));
	printf("Real function: %d\n", strcmp("", "AAAAAA"));
	printf("comparison between %s and %s returns: %d\n", "\0", "\200", ft_strcmp("\0", "\200"));
	printf("Real function: %d\n", strcmp("\0", "\200"));
}

void		test_write(void)
{
	int ret;

	printf("\n**Check ft_write**\n");
  ret = ft_write(1,"hello_world", 12);
	printf("//its return:%d\n", ret);
	ret = ft_write(12,"hello_world\n", 12);
	printf("wrong fd return:%d\n", ret);
	ret = ft_write(1,"hello_world\n", -12);
	printf("negative bytes return:%d\n", ret);
	ret = ft_write(1,"", 0);
	printf("0 bytes return:%d\n", ret);
	ret = ft_write(12,"", 0);
	printf("0 bytes return wrong file descriptor:%d\n", ret);
	printf("String is zero:%zd\n",ft_write(1, 0, 12));
}

void		test_read(void)
{
  int fd;
	int ret;
  char buff[13];

  fd = open("utils/text.txt", O_RDONLY);
	printf("\n**Check ft_read**\n");
  ret = ft_read(fd, buff, 12);
  printf("This has been read in text.txt: %s and this has been returned:%d\n", buff, ret);
	printf("read negative bytes return:%zd\n",ft_read(fd, buff, -1));
	printf("Wrong fd return:%zd\n",ft_read(12, buff, 12));
	printf("String is zero:%zd\n",ft_read(fd, 0, 12));
}

void   test_strdup(void)
{
  char	str[9] = "12345678";
	char	str2[2] = "a";
  char	str3[1] = "";

	printf("\n**Check ft_strdup**\n");
	printf("duplicate '%s' into: '%s'\n", str, ft_strdup(str));
	printf("freeing the string\n");
	free(ft_strdup(str));
	printf("duplicate '%s' into: '%s'\n", str2, ft_strdup(str2));
	printf("freeing the string\n");
	free(ft_strdup(str2));
  printf("duplicate empty string into: '%s'\n", ft_strdup(str3));
	printf("freeing the string\n");
	free(ft_strdup(str3));
}

int main()
{
  test_strlen();
  printf("\n");
  test_strcpy();
  printf("\n");
  test_strcmp();
  printf("\n");
  test_write();
  printf("\n");
  test_read();
  printf("\n");
  test_strdup();
  printf("\n");
}
