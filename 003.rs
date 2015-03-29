use std::num::Float;

fn main() {
    let mut n: u64 = 600851475143;
    let mut factor: u64 = 1;
    // Only required to check factors from 2 to sqrt(n) + 1
    // Once we pass the sqrt(n) + 1 we are checking divisors we
    // have already tried.
    for i in 2..(((n as f64).sqrt() + 1.0) as u64) {
       // Keep reducing.
        while n % i == 0 {
            n /= i;
            factor = i;
        }
        // Largest factor found.
        if n == 1 {
            break;
        }
    }
    println!("{}", factor);
}
