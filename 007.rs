fn main() {

    let mut primes = vec![2];

    let mut prime_count = 1;
    let mut p = 3;

    loop {
        let mut is_prime = true;
        for div in primes.iter() {
            if p % *div == 0 {
                is_prime = false;
                break;
            }
        }
        if is_prime {
            primes.push(p);
            prime_count += 1;
        }
        if prime_count == 10001 {
            break;
        }
        p += 2;
    }
    println!("{}", p);
}
