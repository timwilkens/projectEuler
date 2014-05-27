#include <stdio.h>
#include <stdbool.h>

static bool divisibleByAll(int n);

int
main (void) {
    int n = 20;

    while (!divisibleByAll(n)) {
        n += 20;
    }

    printf("%d\n", n);
    return 0;
}

static bool
divisibleByAll(int n) {

    for (int i = 2; i <= 20; i++) {
        if (n % i != 0) {
            return false;
        }
    }
    return true;
}
