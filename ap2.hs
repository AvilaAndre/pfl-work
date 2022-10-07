import Data.Char
import GHC.Float (sqrtFloat)

--2.1

-- a)
myand:: [Bool] -> Bool
myand a
    | null a = False
    | head a && tail a /= [] = myand (tail a)
    | head a && null (tail a) = True
    | not (head a) = False
    | otherwise = False

myand' :: [Bool] -> Bool
myand' [] = False
myand' (x:xs) = x && myand xs

-- b)

myor :: [Bool] -> Bool
myor a
    | null a = False
    | not (head a) && tail a /= [] = myor (tail a)
    | not (head a) && null (tail a) = False
    | head a = True
    | otherwise = False

myor' :: [Bool] -> Bool
myor' [] = False
myor' (x: xs) = x || myor' xs

-- c)

myconcat :: [[a]] -> [a]
myconcat a
    | null a = []
    | null (head a) && null (tail a) = []
    | null (head a) = myconcat (tail a)
    | not (null (head a)) = head (head a) : myconcat (drop 1 (head a):tail a)
    | otherwise = []

myconcat' :: [[a]] -> [a]
myconcat' [] = []
myconcat' (x:xs) = x ++ myconcat' xs

-- d)

myreplicate:: Int -> a -> [a]
myreplicate a b
    | a > 0 =  b : myreplicate (a-1) b
    | otherwise = []

-- e)
mylistsel:: [a] -> Int -> a
mylistsel a b
    | null a = error "empty list"
    | b == 0 = head a
    | b > 0 = mylistsel (drop 1 a) (b-1)
    | b < 0 = error "negative number"
    | otherwise = error "empty list"

mylistsel':: [a] -> Int -> a
mylistsel' a 0 = head a
mylistsel' a b | b < 0 = error "negative index"
mylistsel' [] b = error "list not big enough"
mylistsel' a b = mylistsel' (drop 1 a) (b-1)

-- f)

myelem:: Eq a => a -> [a] -> Bool
myelem t l
    | null l = False
    | head l == t = True
    | otherwise = myelem t (drop 1 l)

--2.2


myintersperse :: a -> [a] -> [a]
myintersperse a l
            | length l > 1 = take 1 l ++ [a] ++ myintersperse a (drop 1 l)
            | length l == 1 = take 1 l
            | otherwise = []

--2.3

mdc:: Integer -> Integer -> Integer
mdc a b
    | b == 0 = a
    | otherwise = mdc b (a `mod` b)


--2.4

-- a)

myinsert:: Ord a => a -> [a] -> [a]
myinsert a l
        | null l = [a]
        | a < head l = a : l
        | otherwise = take 1 l ++ myinsert a (drop 1 l)

-- b) 

myisort :: Ord a => [a] -> [a]
myisort l
    | null l = []
    | length l > 1 = myinsert (head l) (myisort (tail l))
    | otherwise = [head l]


--2.5

-- a)

myminimum :: Ord a => [a] -> a
myminimum l
    | length l == 1 = head l
    | null l = error "empty list"
    | head l >= l !! 1 = myminimum (drop 1 l)
    | otherwise = myminimum (head l: drop 2 l)


-- b)

mydelete :: Eq a => a -> [a] -> [a]
mydelete c l
    | null l = []
    | head l == c = drop 1 l
    | otherwise = head l : mydelete c (drop 1 l)


-- c)

myssort :: Ord a => [a] -> [a]
myssort l
    | null l = l
    | otherwise = myminimum l : myssort (mydelete (myminimum l) l)


--2.6


mysoma :: (Num a, Enum a) => a -> a -> a
mysoma a b = sum [x ^ 2 | x <- [a..b]]


--2.7 

myapprox :: Int -> Double
myapprox n = sum [((-1)^k) / fromIntegral (2*k+1) | k <- [0.. n]]

--2.8

dotprod :: [Float] -> [Float] -> Float
dotprod x y = sum [a * b | (a, b) <- zip x y]

--2.9

divprop :: Integer -> [Integer]
divprop a = [x | x <- [1 .. a-1], a `mod` x == 0 ]

--2.10

perfeitos :: Integer -> [Integer]
perfeitos a = [x | x <- [1 .. a-1], sum (divprop x) == x ]

--2.11

pitagoricos :: Integer -> [(Integer, Integer, Integer)]
pitagoricos a = [(x, y, z) | x <- [1..a], y <- [1..a], z <- [1..a], (x^2 + y^2) == z^2]

--2.12 

primo :: Integer -> Bool
primo a = (length (divprop a) + 1) == 2

--2.13

mersennes :: [Int]
mersennes = [ n | n <- [0 .. 30], primo (2^n - 1)]

--2.14

binom :: Integer -> Integer -> Integer
binom n k = product [1 .. n] `div` (product [1 .. k] * product [1 .. (n - k)])

pascal :: Integer -> [[Integer]]
pascal n = [[binom y x |x <- [0..y]] | y <- [0..n]]

--2.15

cifrarLetra :: Int -> Char -> Char
cifrarLetra a l
        | l == ' ' = ' '
        | isUpper l = chr (((ord l - ord 'A') + a) `mod` 26 + ord 'A')
        | isLower l = chr (((ord l - ord 'a') + a) `mod` 26 + ord 'a')
        | otherwise = l

cifrar :: Int -> String -> String
cifrar a b = [ cifrarLetra a x | x <- b]

--2.16

comconcat :: [[a]] -> [a]
comconcat = foldl ((++)) []

comreplicate :: Int -> a -> [a]
comreplicate n a = [a |x <- [1 .. n]]

comunequal :: [a] -> Int -> [a]
comunequal l idx = [head (drop x l) | x <- [0 .. length l], x == idx]

--2.17

forte :: String -> Bool
forte a = length a > 7
    && not (null ([True |x <- a, isUpper x]))
    && not (null ([True |x <- a, isLower x]))
    && not (null ([True |x <- a, isDigit x]))

--2.18

-- a)

mindiv :: Int -> Int
mindiv n = head [p |p <- [ floor (sqrt (fromIntegral n)) .. n + 1], q <- [0 .. floor (sqrt (fromIntegral n))], p* q == n ]

-- b)

betterprimo :: Int -> Bool
betterprimo n = mindiv n == n

--2.19

mynub :: Eq a => [a] -> [a]
mynub l = [l !! x | x <- [0 .. length l - 1], foldl (\tot cur -> tot && (cur /= l !! x)) True (take x l) ]


--2.20

mytranspose :: [[Int]] -> [[Int]]
mytranspose mat =  [ concat [[tot !! y] | y <- [x , (x + length (head mat))  .. length (head mat) * length mat -1] ] | x <- [0..2]]
                where tot = concat mat

--2.21

algarismos :: Int -> [Int]
algarismos n | n > 0 = algarismos (n `div` 10) ++ [n `mod` 10] 
algarismos n = []

--2.22

toBits :: Int -> [Int]
toBits n | n > 0 = toBits (n `div` 2) ++ [n `mod` 2] 
toBits n = []

--2.23

fromBits :: [Int] -> Int
fromBits [] = 0
fromBits l | head l == 0 = fromBits (drop 1 l)
fromBits l = 2^ (length l - 1) + fromBits (drop 1 l)

--2.24 

-- a)

merge :: Ord a => [a] -> [a] -> [a]
merge a b | null a && null b = []
merge a b | null a && not (null b) = head b : merge a (drop 1 b)
merge a b | null b && not (null a) = head a : merge (drop 1 a) b
merge a b | head a > head b = head b : merge a (drop 1 b)
merge a b | head a <= head b = head a : merge (drop 1 a) b

-- b)

msort :: Ord a => [a] -> [a]
msort l | length l < 2 = l
msort l = merge (msort (take (length l `div` 2) l)) (msort (drop (length l `div` 2) l))