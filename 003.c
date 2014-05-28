#include <stdio.h>

int
main() {
  long n = 600851475143;
  int d = 2;

  while (n > 1) {
    while (n % d == 0) {
      printf("Divisor: %d\n", d);
      n /= d;
    }
    d++;
  }
  return 0;
}
