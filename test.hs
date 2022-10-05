
doubleIt :: Int -> Int
doubleIt x = x*2

concat :: [[a]] -> [a]
concat listas = [valor | lista <- listas, valor  <- lista]

divisores :: Int -> [Int]
divisores n = [x | x<-[1..n], n`mod`x==0]


--TODO: Criar testaPrimo
--primos :: Int -> [Int]
--primos n = [x | x<-[2..n], testaPrimo x]


paresIguais :: Eq b => [b] -> Int
paresIguais xs = length [(x, x') | (x, x') <- zip xs (tail xs), x==x']

factorial :: (Eq p, Num p) => p -> p
factorial 0 = 1
factorial n = n * factorial (n-1)


preencher n xs = take n (xs ++ repeat ' ')

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)


data Figura = Circ Float
            | Rect Float Float
              deriving (Eq, Show)

data Maybe a = Nothing | Just a -- do prelúdio padrão

data Produto = Produto Nome Stock PrecoCusto PrecoVenda deriving (Show)

type Nome = String
type Stock = Int
type PrecoCusto = Double
type PrecoVenda = Double

inventario :: [Produto]
inventario  = [Produto "Haskell for Dummies" 200 10.0 15.0, Produto "Produto2" 100 15.0 25.0]



main :: IO ()
main = do
    putStrLn "Hello, world!"
    print (map doubleIt [5, 10, 15])

    -- GENERATORS

    -- generating every pair possible between [1, 2, 3] and [4, 5]
    print [(x, y) | x <- [1, 2, 3], y <- [4, 5]]

    -- Using the x variable on the y array
    print [(x, y) | x <- [1 .. 3], y <- [x .. 5]]

    -- print (concat [[1, 2, 3]]) 

    print (divisores 15)

    print (zip [1,2,3] ['a', 'b'])

    print (paresIguais [1, 1, 1, 2, 2, 1])

    print (tail [1, 2, 3, 4])

    print (factorial 5)
    print (map factorial [1, 3, 4, 5, 6])
    -- WRITE ON CONSOLE -- takeWhile (\n -> n * n < 10) [1..5]
    print ( foldl (+) 0 [1, 2, 3, 4, 5])
    print ( foldr (+) 0 [1, 2, 3, 4, 5])

    print ( take 10 (iterate (2*) 1))

