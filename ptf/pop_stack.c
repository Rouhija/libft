/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pop_stack.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: srouhe <srouhe@student.hive.fi>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/03 15:35:10 by srouhe            #+#    #+#             */
/*   Updated: 2019/12/05 16:28:58 by srouhe           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

char		*pop_string(t_ptf **p)
{
	char	*r;

	if (!(r = va_arg((*p)->ap, char *)))
		r = "(null)";
	return (ft_memdup(r, ft_strlen(r)));
}

char		*pop_char(t_ptf **p)
{
	char	r[2];

	r[0] = va_arg((*p)->ap, int);
	r[1] = '\0';
	return (ft_memdup(r, 2));
}

char		*pop_signed(t_ptf **p)
{
	if ((*p)->flags & L_L)
		return (ft_itoa(va_arg((*p)->ap, long)));
	else if ((*p)->flags & L_LL)
		return (ft_itoa(va_arg((*p)->ap, long long)));
	else if ((*p)->flags & L_HH)
		return (ft_itoa((char)va_arg((*p)->ap, int)));
	else if ((*p)->flags & L_H)
		return (ft_itoa((short)va_arg((*p)->ap, int)));
	else if ((*p)->flags & L_J)
		return (ft_itoa(va_arg((*p)->ap, intmax_t)));
	else
		return (ft_itoa(va_arg((*p)->ap, int)));
}

char		*pop_unsigned(t_ptf **p)
{
	int			base;
	u_int64_t	nb;

	base = 10;
	if ((*p)->c == 'b')
		base = 2;
	else if ((*p)->c == 'o')
		base = 8;
	else if ((*p)->c == 'x' || (*p)->c == 'X' || (*p)->c == 'p')
		base = 16;
	if ((*p)->flags & L_L)
		nb = (u_int64_t)va_arg((*p)->ap, unsigned long int);
	else if ((*p)->flags & L_LL)
		nb = (u_int64_t)va_arg((*p)->ap, unsigned long long int);
	else if ((*p)->flags & L_HH)
		nb = (unsigned char)va_arg((*p)->ap, unsigned int);
	else if ((*p)->flags & L_H)
		nb = (unsigned short)va_arg((*p)->ap, unsigned int);
	else if ((*p)->flags & L_Z)
		nb = (u_int64_t)va_arg((*p)->ap, size_t);
	else if ((*p)->flags & L_J)
		nb = (u_int64_t)va_arg((*p)->ap, uintmax_t);
	else
		nb = (u_int64_t)va_arg((*p)->ap, unsigned int);
	return (ft_itoa_base(nb, base));
}
