import System.Environment

main = getArgs >>= print . (foldr apply 0) . reverse

apply :: String -> Integer -> Integer
apply [] result = 0;
-- TODO: implement!!!
apply "-r" result = -3
apply "-k" result = 1
apply "-i" result = result + 1
apply "-h" result = quot result 2 -- quot entspricht integer-division in java
apply "-t" result = result * 3
apply s result = result -- default case