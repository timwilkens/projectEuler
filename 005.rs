// There is a better way using LCM, but this is easier
// and still relatively quick.

fn all_twenty(n: i32) -> bool {
    for i in 2..20 {
        if n % i != 0 {
            return false;
        }
    }
    true
}

fn main() {
    let mut n = 20;

    loop {
        if all_twenty(n) {
            break;
        }
        n += 20;
    }
    println!("{}", n);
}
