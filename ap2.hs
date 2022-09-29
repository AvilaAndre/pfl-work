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

-- myele n 0 = 1
-- myele n b = n * myele n b-1

-- myapprox :: Int -> Double
-- myapprox n = [(-1)^k | k <- [1..n]]