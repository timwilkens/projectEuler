answer = head $ take 1 [a * b * c| a <- [150..500], b <- [a..500], c <- [b..500], a^2 + b^2 == c^2, a + b + c == 1000]

main = do
  putStrLn $ show answer
