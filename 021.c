#include <stdio.h>
#include <stdbool.h>

static int find_amicable(int n);
static bool contains(int n, int *nums, int end);
static int sum_array(int *nums, int end);

int
main(void) {
    int amicables[100];
    int *p = amicables;
    int length = sizeof(amicables)/sizeof(amicables[0]);

    for (int i = 1; i <= 10000; i++) {
        int a = find_amicable(i);
        if (a == i) {
            continue;
        }
        int b = find_amicable(a);
        if (i == b) {
            if (!contains(i, amicables, length)) {
                *p++ = i;
            }

            if (!contains(b, amicables, length)) {
                *p++ = b;
            }
        }
    }
 
    int total = sum_array(amicables, length);
    printf("%d\n", total);
    return 0;
}

static int 
sum_array(int *nums, int end) {
    int total = 0;
    for (int i = 0; i < end && nums[i] != 0; i++) {
        total += nums[i];
    }
    return total;
}

static bool
contains(int n, int *nums, int end) {

    for (int i = 0; i < end; i++) {
        if (nums[i] == n) {
            return true;
        }
    }
    return false;
}

static int
find_amicable(int n) {

    int total = 0;
    for (int i = 1; i < n / 2 + 1; i++) {
        if (n % i == 0) {
            total += i;
        }
    }
    return total;
}
