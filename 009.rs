fn is_triplet(a: i32, b: i32, c: i32) -> bool {
    a * a + b * b == c * c
}

fn main() {
    // The max value c can have is 997 since a and b need values and b > a
    'outer: for c in 1..997 {
        // b cannot exceed c
        for b in 1..c {
            // a cannot exceed b
            for a in 1..b {
                if a + b + c == 1000 {
                    if is_triplet(a, b, c) {
                        println!("a: {}, b: {}, c: {}", a, b, c);
                        println!("{}", a * b * c);
                        break 'outer;
                    }
                }
            }
        }
    }
}
