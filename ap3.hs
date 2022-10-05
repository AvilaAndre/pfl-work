import Data.Char

--3

--3.1

doubleIt :: Int -> Int
doubleIt x = x*2

biggerThan5 :: Int -> Bool
biggerThan5 x = x > 5

trespontoum f p l = map f (filter p l)

--3.2

dec2int :: [Int] -> Int
dec2int = foldl (\tot cur -> tot*10 + cur) 0

--3.3

myzipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myzipWith f [] [] = []
myzipWith f l1 l2 = f (head l1) (head l2) :  myzipWith f (drop 1 l1) (drop 1 l2)

--3.4

myinsert:: Ord a => a -> [a] -> [a]
myinsert a l
        | null l = [a]
        | a < head l = a : l
        | otherwise = take 1 l ++ myinsert a (drop 1 l)


isort :: Ord a => [a] -> [a]
isort = foldr myinsert []


--3.5 

-- a)

mymaximum :: Ord a => [a] -> a
mymaximum l = foldr1 max l

myminimum :: Ord a => [a] -> a
myminimum l = foldr1 min l

-- b)
--myfoldr1 :: Foldable t => (a -> a -> a) -> t a -> a
myfoldr1 f a | null a = error "empty list"
myfoldr1 f l = foldr f l []

mymaximum2 l = foldr1 max l 

-- I'm not understanding this one

--3.6

mdc :: Int -> Int -> Int
mdc a b = fst (until (\(a,b) -> b == 0) (\(a,b) -> (b,a`mod`b)) (a,b))

--3.5


-- a)
myplusplus :: [a] -> [a] -> [a]
myplusplus a b = foldr(\cur new -> (cur : new)) b a

-- b)

myconcat :: [[a]] -> [a]
myconcat l = foldr (\cur new -> myplusplus cur new) [] l

-- c)

myreverse1 :: [a] -> [a]
myreverse1 l = foldr(\cur new -> myplusplus new [cur] ) [] l

-- d)

myreverse2 :: [a] -> [a]
myreverse2 l = foldl(\cur new -> new : cur) [] l

-- e)
myelem :: Eq a => a -> [a] -> Bool
myelem a = any (a==)

--3.8

-- a) I DO NOT RECOMMEND THIS SOLUTION, SOMEONE MUST KNOW HOW TO DO THIS CORRECTLY

getpalavra :: String -> Int -> Int
getpalavra str count | null (drop count str) = count
getpalavra str count | head (drop count str) == ' ' = count + 1
getpalavra str count = getpalavra str (count + 1)

wordpairs :: [Int] -> [[Int]]
wordpairs l = filter (\(x:xs) -> x /= (head xs)) (filter (\x -> length x > 1) (pairs l))

decomposeword :: String -> [Int]
decomposeword txt = take (length txt) (iterate (getpalavra txt) 0)

pairs :: [a] -> [[a]]
pairs (_: []) = [[]]
pairs a = [(head a : [head (drop 1 a)])]++ pairs (drop 1 a)

palavras :: String -> [String]
palavras txt = [take (head xs - 1) (drop x txt) | (x:xs) <- (wordpairs (decomposeword txt) ), (head xs - 1) /= x]



