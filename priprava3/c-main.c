//***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Empty project
//
//***************************************************************************

#include <stdio.h>

// Functions
void first_function(int *pole, int len);

int second_function(long *t_pole, int len);

int third_function(char *t_str);

void fourth_function(char *t_str, char t_nahradni_znak);

// Variables
// type g_some_c_variable;



int main()
{
    int pole[10] = { 1, -2, 3, 4, 5, -6, 7, 8, -9, -10 };

    for (size_t i = 0; i < 10; i++)
    {
        printf("%d ", pole[i]);
    }

    printf("\n");

    first_function(pole, 10);

    for (size_t i = 0; i < 10; i++)
    {
        printf("%d ", pole[i]);
    }

    printf("\n");

    long l_pole[10] = { 0x1700000000000000, 0x1200000000000000, 0x3100000000000000, 0x2000000000000000, 0x1100000000000000, 0x1100000000000000, 0x1100000000000000, 0x2900000000000000, 0x1100000000000000, 0x6100000000000000 };
    
    for (size_t i = 0; i < 10; i++)
    {
        printf("0x%lx ", l_pole[i]);
    }

    printf("\n");

    printf("%d\n", second_function(l_pole, 10));

    char t_str[] = "R yb ak192 205"; 

    printf("%s\n", t_str);

    printf("%d\n", third_function(t_str));

    fourth_function(t_str, '|');

    printf("%s\n", t_str);

    return 0;
}
