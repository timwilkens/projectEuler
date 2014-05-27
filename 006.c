#include <stdio.h>

static int square (int n);

int
main (void) {
    int sum100 = 0;
    for (int i = 1; i <= 100; i++) {
        sum100 += i;
    }

    int sumSquares = 0;
    for (int i = 1; i <= 100; i++) {
        sumSquares += square(i);
    }
    printf("%d\n", square(sum100) - sumSquares);
    return 0;
}

static int
square (int n) {
    return n * n;
}
