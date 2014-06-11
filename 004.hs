isPalindrome :: Int -> Bool
isPalindrome n = (reverse $ show n) == show n

answer = maximum [x * y| x <- [999,998..100], y <- [999,998..100], isPalindrome $ x * y]

main = do
  putStrLn $ show answer
