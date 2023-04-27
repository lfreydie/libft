/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lfreydie <lfreydie@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/07 14:58:32 by lfreydie          #+#    #+#             */
/*   Updated: 2023/04/27 10:45:51 by lfreydie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libft.h"

void	*ft_memmove(void *dest, const void *src, size_t n)
{
	int		i;
	char	*d;
	char	*s;

	if (!src && !dest)
		n = 0;
	if (src > dest)
		ft_memcpy(dest, src, n);
	else
	{
		i = (int)n - 1;
		d = (char *)dest;
		s = (char *)src;
		while (&d[i] && &s[i] && i >= 0)
		{
			d[i] = s[i];
			i--;
		}
	}
	return (dest);
}
