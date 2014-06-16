#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX 2000000
#define LIMIT sqrt(MAX)

int
main() {
    char nums[MAX] = {0};
    for (int i = 2; i <= LIMIT; i++) {
        if (!nums[i]) {
            int j = i * i;
            for (int gen = j; gen < MAX; gen += i) {
                nums[gen] = 1;
            }
        }
    }

    // Use a simple wheel to avoid looking at multiples of 2 and 3.
    // Starting at 5 and alternating additions of 2 and 4 guarantees this.
    uint64_t total = 5;
    int flag = 1;
    for (int i = 5; i < MAX;) {
        if (!nums[i]) {
            total += i;
        }
        i += flag++ % 2 == 0 ? 4 : 2;
    }

  printf("%llu\n", total);
  return 0;
}
