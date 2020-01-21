# Description
Library for functions used in Hive projects

## Lightweight dptf
- no float support

## Regex quick reference
- c    matches any literal character c
- .    matches any single character
- ^    matches the beginning of the input string
- $    matches the end of the input string
- *    matches zero or more occurrences of the previous character

## Quick testing
`rm a.out && rm tester.o && make fclean && make && gcc -c tester.c && gcc -Wall -Wextra -Werror *.o -I includes/ -L . -lft`