#include "ft_printf.h"
#include "libft.h"
#include "get_next_line.h"

int		main(void)
{
	ft_printf("Big fmt %.3s\n", "TESTI");
	ft_printf("HEXA %p\n", 1234599);
	return (0);
}
