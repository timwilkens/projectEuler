toDigits :: Integer -> [Integer]
toDigits x
  |x == 0 = []
  |otherwise = toDigits (x `div` 10) ++ [x `mod` 10]

max' :: [Integer] -> Integer -> Integer
max' [] n = n
max' xs n
  | (length $ take 13 $ xs) /= 13 = n
  | otherwise = if (product $ take 13 xs) > n
                then max' (tail xs) (product $ take 13 xs)
                else max' (tail xs) n

maxSum :: [Integer] -> Integer
maxSum xs = max' xs 0

main = do
  content <- readFile "008num.dat"
  putStrLn $ show $ maxSum $ toDigits $ read $ head $ lines content
  
