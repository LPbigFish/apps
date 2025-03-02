#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool get_by_id(unsigned long *array, unsigned long id) {
    return *(array + (id >> 6)) & (1UL << (63 - ((id - 2) & 63)));
}

void toggle_by_id(unsigned long *array, unsigned long id) {
    *(array + (id >> 6)) |= (1UL << (63 - ((id - 2) & 63)));
}

void calculate(unsigned long *array, unsigned int len);
/*     unsigned long n = len * 64 + 1;

    for (size_t i = 2; i < n; i++) {
        if (!get_by_id(array, i)) {
            for (size_t j = 2 * i; j <= n; j += i) {
                toggle_by_id(array, j);
            }
        }
    } */

int main() {
    unsigned long prime_to = 10000000000;

    unsigned int N = prime_to / (sizeof(unsigned long) * sizeof(unsigned long)) + 1;

    unsigned long *array = calloc(N, sizeof(unsigned long));

    calculate(array, N);

    printf("Počítání z %ld prvků...\n", 64 * N + 2);

    unsigned long max = 0;

    for (size_t i = 64 * N; i < prime_to; i++) {
        bool g = get_by_id(array, i);
        if (!g && i > max) {
            max = i;
        }
    }

    printf("Nejvyšší prvočíslo: %ld\n", max);

    printf("\n");

    return 0;
}