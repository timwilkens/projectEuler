isPrime :: Integer -> Bool
-- Way to do this without the type transformations?
isPrime n0 = loop n0 (truncate (sqrt (fromIntegral n0)))
  where loop n d | d == 1 = True
                 | n `mod` d == 0 = False
                 | otherwise = loop n (d - 1)

answer = last $ take 10001 [x | x <- [2..], isPrime x] 

main = do
  putStrLn $ show answer
