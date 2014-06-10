fib :: Int -> Int
fib 1 = 1
fib 2 = 2
fib n = fib(n - 1) + fib(n - 2)

isEven n = if mod n 2 == 0 then True else False

-- Slow because we re-compute fib for each number.
total = sum (filter isEven (takeWhile (< 4000000) (map fib [1..])))

main = do
  putStrLn(show total)
