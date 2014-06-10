fib :: Int -> Int
fib 1 = 1
fib 2 = 2
fib n = fib(n - 1) + fib(n - 2)

-- Slow because we re-compute fib for each number.
total = sum $ filter  (\x -> x `mod` 2 == 0) $ takeWhile (< 4000000) $ map fib [1..]

main = do
  putStrLn(show total)
