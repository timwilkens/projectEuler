fn main() {

    let max_prime = 2000000;

    let mut is_composite = vec![false; max_prime];
    let mut sum = 2;
    let mut candidate = 3;

    while candidate < max_prime {
        if !is_composite[candidate] {
            let mut i = candidate + candidate;
            while i < max_prime {
                is_composite[i] = true;
                i += candidate;
            }
            sum += candidate;
        }
        candidate += 2;
    }
    println!("{}", sum);
}
