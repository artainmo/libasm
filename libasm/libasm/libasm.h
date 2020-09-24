/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: artainmo <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/27 03:58:55 by artainmo          #+#    #+#             */
/*   Updated: 2020/01/27 08:01:12 by artainmo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>

typedef struct s_list
{
  void          *data;
  struct s_list *next;
} t_list;

size_t		ft_strlen(const char *str);
char		  *ft_strdup(const char *s1);
char		  *ft_strcpy(char *s1, char *s2);
char		  ft_strcmp(char *s1, char *s2);
ssize_t	  ft_write(int fd, void const *buf, size_t nbyte);
ssize_t	  ft_read(int fd, void *buf, size_t nbyte);

#endif
