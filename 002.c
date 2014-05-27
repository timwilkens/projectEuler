#include <stdio.h>

int
main (void) {
    int total = 0;
    int last = 1;
    int current = 2;

    while (current < 4000000) {
        if (current % 2 == 0) {
            total += current;   
        }
    int temp = last;
    last = current;
    current = last + temp;
    }

    printf("%d\n", total);
    return 0;
}
