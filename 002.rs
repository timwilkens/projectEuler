fn main() {
    let mut previous = 1;
    let mut current = 2;

    let mut sum = 0;

    while current < 4000000 {
        if current % 2 == 0 {
            sum += current;
        }
        let temp = current;
        current += previous;
        previous = temp;
    }
    println!("{}", sum);
}
