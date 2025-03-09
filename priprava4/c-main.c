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
void bubble( int *tp_int, int t_N );

void strup( char *t_str );

char nejcastejsi( char *t_str );

long prvocislo( long t_cislo );

int main()
{
    int pole[10] = { 2, 5, 1, 3, 6, 8, 9, 0, 7, 4 };

    for (int i = 0; i < 10; i++) {
        printf("%d ", pole[i]);
    }
    printf("\n");

    bubble(pole, 10);

    for (int i = 0; i < 10; i++) {
        printf("%d ", pole[i]);
    }
    printf("\n");

    char t_str[10] = "aBcdEfGhi";
    printf("%s", t_str);
    printf("\n");

    strup(t_str);

    printf("%s", t_str);
    printf("\n");

    char t_str2[] = "";
    
    printf("%s", t_str2);
    printf("\n");
/* 
    printf("%c", nejcastejsi(t_str2));
    printf("\n");
 */
    printf("Prvočíslo 17: %ld\n", prvocislo(17));
    printf("Číslo 81: %ld\n", prvocislo(81));
    printf("\n");

    return 0;
}
