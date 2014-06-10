fib = 1 : 1 : [ a+b | (a,b) <- zip fib (tail fib) ]
total = sum $ filter  (\x -> x `mod` 2 == 0) $ takeWhile (< 4000000) fib

main = do
  putStrLn(show total)
