isDivisible :: Integer -> Bool
isDivisible x0 = loop x0 2
  where loop x y | y == 21 = True
                 | x `mod` y == 0 = loop x $ y + 1
                 | otherwise = False

answer = head [x | x <- [20,40..], isDivisible x]

main = do
  putStrLn $ show answer
