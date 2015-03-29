fn is_palindrome(n: i32) -> bool {
    let s = n.to_string();
    let rev: String = s.chars().rev().collect();
    rev == s
}

fn main() {
    let mut largest = 0;
    for i in 100..999 {
        for j in 100..999 {
            let p = i * j;
            // Place the greater than check first to cut down on calls to is_palindrome.
            if p > largest && is_palindrome(p)  {
                largest = p;
            }
        }
    }
    println!("{}", largest);
}
