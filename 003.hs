factors :: Integer -> [Integer]
factors n0 = loop 2 n0 []
  where loop x y zs |y == 1 = zs
                    |y `mod` x == 0 = loop x (y `div` x) (x : zs)
                    |otherwise = loop (x + 1) y zs 

main = do
  putStrLn $ show $ head $ factors 600851475143
