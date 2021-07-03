/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   print_char.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: youkim <youkim@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/06/29 14:44:38 by youkim            #+#    #+#             */
/*   Updated: 2021/07/03 13:56:26 by youkim           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	print_char(int c, t_info *info)
{
	char	s[2];
	int		result;

	result = 0;
	s[0] = c;
	s[1] = 0;
	if (info->type == '%' && info->lalign)
		info->zeropad = false;
	result += print_width(info, s);
	return (result);
}
