#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct Key
{
    char first;
    char second;
    char third;
} Key;

void create_keys_from_file(Key *keys, char *nums, int nums_length);
bool contains(char x, char *nums, int end);
bool has_all_digits(char *digits_in_key, int keys_length, long long n);
bool matches_keys(Key *keys, int keys_length, long long n);

int
main(void)
{
    /* Our key structs. */
    Key keys[50];
    int keys_length = sizeof(keys)/sizeof(keys[0]);

    /* Array of chars of the digits in our key file */
    char digits[20];
    int digits_length = sizeof(digits)/sizeof(digits[0]);

    create_keys_from_file(keys, digits, digits_length);

    /* Our possible solution int
       Know from the key file that we need at LEAST 8 digits */
    long long n = 10000000;

    while(true) {
        printf("%lld\n", n);
        if (has_all_digits(digits, digits_length, n)) {
            if (matches_keys(keys, keys_length, n))
                break;
        }
        n++;
    }

    printf("%lld\n", n);
    return 0;
}

bool 
matches_keys(Key *keys, int keys_length, long long n)
{
    char n_digits[20];
    int n_length = sizeof(n_digits)/sizeof(n_digits[0]);
    sprintf(n_digits, "%lld", n);


    for (int i = 0; i < keys_length; i++) {
        int matched = 0;
        /* Walk the digits in our guess */
        for (int j = 0; j < n_length && n_digits[j] != '\0'; j++) {
            if (matched == 0 && n_digits[j] == keys[i].first) {
                matched = 1;
            } else if (matched == 1 && n_digits[j] == keys[i].second) {
                matched = 2;
            } else if (matched == 2 && n_digits[j] == keys[i].third) {
                matched = 3;
            }
        }
        if (matched != 3) {
            return false;
        }
    }
    return true;
}

/* Check if any possible solution actually contains all the keys */
bool
has_all_digits(char *digits_in_keys, int keys_length, long long n)
{

    char n_digits[20];
    int n_length = sizeof(n_digits)/sizeof(n_digits[0]);
    sprintf(n_digits, "%lld", n);

    for (int i = 0; i < keys_length && digits_in_keys[i] != '\0'; i++) {
        if (!contains(digits_in_keys[i], n_digits, n_length)) {
            return false;
        }
    }
    return true;
}

/* Create a list of Key structs from the key file */
void
create_keys_from_file(Key *keys, char *nums, int nums_length)
{
    char *n = nums;
    FILE *keylog = fopen("079keylog.dat", "r");

    if (keylog == NULL) {
        printf("Could not open keylog file\n");
        exit(1);
    }

    int k = 0;
    Key *p = keys;
    while (fscanf(keylog, "%d", &k) != EOF) {
        char digits[4];
        sprintf(digits, "%d", k);

        Key key = {digits[0], digits[1], digits[2]};
        *p++ = key;

        /* Build up the list of digits in the keyfile */
        for (int i = 0; i < 3; i++) {
            if (!contains(digits[i], nums, nums_length)) {
               *n++ = digits[i]; 
            }
        }
    }
    fclose(keylog);
}

/* Check if a char exists in a char array */
bool 
contains(char x, char *nums, int end)
{
    for (int i = 0; i < end && nums[i] != '\0'; i++) {
        if (nums[i] - 0 == x - 0) {
            return true;
        }
    }
    return false;
}
