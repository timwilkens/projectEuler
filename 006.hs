main = do
  putStrLn $ show $ (sum [x| x <- [1..100]])^2 - sum [x^2 | x <- [1..100]]
