fn squared_sum(n: i32) -> i32 {
    let sum = (n * (n+1)) / 2;
    sum * sum
}

fn sum_of_squares(n: i32) -> i32 {
    let mut acc = 0;
    for i in 1..(n+1) {
        acc += i * i;
    }
    acc
}

fn main() {
    println!("{}", squared_sum(100) - sum_of_squares(100)); 
}
