#include <stdio.h>
#include <stdbool.h>
#include <string.h>

bool is_permuted_multiple(long long x);
void get_multiples(int x, long long *nums);
bool has_all_digits(char *control, int control_length, char *test, int test_length);
bool contains(int x, char *nums, int end);

int
main(void) {

    long long x = 2;
    while (!is_permuted_multiple(x)) {
        x++;
    }
    printf("%lld\n", x);

    return 0;
}

bool 
is_permuted_multiple(long long x) {
    long long nums[7];
    get_multiples(x, nums);

    // Digits in our original number.
    char control[10];
    int control_length = sizeof(control)/sizeof(control[0]);
    sprintf(control, "%lld", nums[1]);

    // Test digits in our multiples (2x, 3x, 4x, 5x, 6x).
    for (int i = 2; i < 7; i++) {
        char test[10];
        int test_length = sizeof(test)/sizeof(test[0]);
        sprintf(test, "%lld", nums[i]);
        if (!has_all_digits(control, control_length, test, test_length)) {
            return false;
        }
    }
    return true;
}

void
get_multiples(int x, long long *nums) {
    nums[0] = 0;
    for (int i = 1; i < 7; i++) {
        nums[i] = x * i;
    }
}

bool 
has_all_digits(char *control, int control_length, char *test, int test_length) {

    if (control_length != test_length) {
        return false;
    }

    // Make a copy so we can remove matched chars.
    char control_copy[control_length];
    memcpy(control_copy, control, control_length);

    for (int i = 0; i < test_length && test[i] != '\0'; i++) {
        if (!contains(test[i], control_copy, control_length)) {
            return false;
        }
    }
    return true;
}

bool 
contains(int x, char *nums, int end) {
    for (int i = 0; i < end && nums[i] != '\0'; i++) {
        if (nums[i] == x) {
            // Set to '.' arbitrarily. Better way?
            nums[i] = '.';
            return true;
        }
    }
    return false;
}
