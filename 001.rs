fn main() {
    let mut acc = 0;
    for i in 3..1000 {
        if i % 3 == 0 || i % 5 == 0 {
            acc += i;
        }
    }
    println!("{}", acc);
}
