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

mdc b a | b == 0 = a 
mdc b a = a `mod` b 
