-- 1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c
    | a < b + c
    && b < a + c
    && c < a + b = True
    | otherwise = False

--1.2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt(s * (s - a) * (s - b) * (s - c))
                        where s = (a + b + c)/2

--1.3
metades :: [a1] -> ([a1], [a1])
metades a = (take s a, drop s a)
        where s = (length a) `div` 2

--1.4
--  a)
last' :: [a] -> [a]
last' a = take 1 (reverse a)

--  b)
init' :: [a] -> [a]
init' a = reverse (drop 1 (reverse a))

--1.5
--  a)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

binom :: Integer -> Integer -> Integer
binom n k = product [1 .. n] `div` (product [1 .. k] * product [1 .. (n - k)])

--b)
binom' ::  Int -> Int -> Int
binom' n k
    | k < n - k = product [(n - k + 1) .. n] `div` product [1 .. k]
    | otherwise = product [(k+1) .. n] `div` product [1 .. (n-k)]

--1.6
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ((-b + sqrt(delta)) / (2 * a), (-b - sqrt(delta)) / (2 * a))
        where delta = (b^2) - 4 * a * c

--1.7
-- a) [Char], String
-- b) Tuplo de chars
-- c) Lista de Tuplos
-- d) Tuplo de Lista
-- e) Lista de métodos?
-- f) 

--1.8
--TODO:

--1.9
classifica :: Int -> String
classifica nota
    | nota <= 9 = "reprovado 😢"
    | nota <= 12 = "suficiente 🤨"
    | nota <= 15 = "bom 😊"
    | nota <= 18 = "muito bom 😁"
    | nota <= 20 = "muito bom com distinção 😎"
    | otherwise = "não sei 🤷"

--1.10
calcIMC ::  Float -> Float -> String
calcIMC peso altura
    | imc < 18.5 = "baixo peso 😢"
    | imc < 25 = "peso normal 🤨"
    | imc < 30 = "excesso peso 😁"
    | otherwise = "obesidade 🤷"
        where imc = peso / (altura^2)

--1.11
-- a) e b)
min3 :: Ord a => a -> a -> a -> a
min3 x y = min a
        where a = min x y


max3 :: Ord a => a -> a -> a -> a
max3 x y = max a
        where a = max x y


--1.12
xor :: Bool -> Bool -> Bool
xor a b = a /= b


--1.13
safetail :: [a] -> [a]
safetail [] = []
safetail (x:xs) = xs

--1.14
curta :: [a] -> Bool
curta a = length a < 3

curta' :: [a] -> Bool
curta' [] = True
curta' [_] = True
curta' [_, _] = True
curta' _ = False

--1.15
mediana :: Ord a => a -> a -> a -> a
mediana a b c
    | a <= b && b <= c = b
    | c <= b && b <= a = b
    | b <= a && a <= c = a
    | c <= a && a <= b = a
    | a <= c && c <= b = c
    | b <= c && c <= a = c

mediana' :: (Num a, Ord a) => a -> a -> a -> a
mediana' a b c = a + b + c - max c s - min c t
            where s = max a b
                  t = min a b


--1.16

converteUni :: Int -> String
converteUni num
        | num == 1 = "um"
        | num == 2 = "dois"
        | num == 3 = "três"
        | num == 4 = "quatro"
        | num == 5 = "cinco"
        | num == 6 = "seis"
        | num == 7 = "sete"
        | num == 8 = "oito"
        | num == 9 = "nove"

converteSpe :: Int -> String
converteSpe num
        | num == 1 = "um"
        | num == 2 = "dois"
        | num == 3 = "três"
        | num == 4 = "quatro"
        | num == 5 = "cinco"
        | num == 6 = "seis"
        | num == 7 = "sete"
        | num == 8 = "oito"
        | num == 9 = "nove"

converteDec :: Int -> String
converteDec num
        | num3 == 10 = "dez"
        | num3 == 20 = "vinte"
        | num3 == 30 = "trinta"
        | num3 == 40 = "quarenta"
        | num3 == 50 = "cinquenta"
        | num3 == 60 = "sessenta"
        | num3 == 70 = "setenta"
        | num3 == 80 = "oitenta"
        | num3 == 90 = "noventa"
            where num2 = num `mod` 10
                  num3 = num - num2

converte :: Int -> String
converte num = converteDec (num `mod` 100)


main :: IO ()
main = do
    putStrLn "Aula Prática 1"
    print (classifica 17)