-- 1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = a < b + c && b < a + c && c < a + b

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
last'' :: [a] -> a
last'' a = head (reverse a)

--  b)
init' :: [a] -> [a]
init' a = reverse (drop 1 (reverse a))
init'' :: [a] -> [a]
init'' a = reverse (tail (reverse a))

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
raizes a b c 
        | delta >= 0 = ((-b + sqrt(delta)) / (2 * a), (-b - sqrt(delta)) / (2 * a)) 
        | otherwise = error "negative delta"
        where delta = (b^2) - 4 * a * c


--1.7
-- a) [Char], String
-- b) Tuplo de chars
-- c) Lista de Tuplos
-- d) Tuplo de Lista
-- e) Lista de métodos?
-- f) Eq [a]



--1.8
--TODO:
-- a) 
segundo :: [a] -> a
segundo xs = head (tail xs)

-- b)
trocar :: (b, a) -> (a, b)
trocar (x, y) = (y, x)

-- c)
par :: a -> b -> (a, b)
par x y = (x, y)

-- d)
dobro :: Int -> Int
dobro x = 2*x

-- e)
metade :: Fractional a => a -> a
metade x = x/2

-- f) 
minuscula :: Char -> Bool
minuscula x = x >= 'a' && x <= 'z'

-- g)
intervalo :: Ord a => a -> a -> a -> Bool
intervalo x a b = x >= a && x <= b

-- h)
palindromo :: Eq a => [a] -> Bool
palindromo xs = reverse xs == xs

-- i)
twice :: (t -> t) -> t -> t
twice f x = f (f x)

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
    | otherwise = error "mediana"

mediana' :: (Num a, Ord a) => a -> a -> a -> a
mediana' a b c = a + b + c - max c s - min c t
            where s = max a b
                  t = min a b


--1.16

converteUni :: Int -> String
converteUni num 
        | num == 0 = "zero"
        | num == 1 = "um"
        | num == 2 = "dois"
        | num == 3 = "tres"
        | num == 4 = "quatro"
        | num == 5 = "cinco"
        | num == 6 = "seis"
        | num == 7 = "sete"
        | num == 8 = "oito"
        | num == 9 = "nove"
        | otherwise = error "1s not supposed"

converteSpe :: Int -> String
converteSpe num
        | num == 10 = "dez"
        | num == 11 = "onze"
        | num == 12 = "doze"
        | num == 13 = "treze"
        | num == 14 = "catorze"
        | num == 15 = "quinze"
        | num == 16 = "dezasseis"
        | num == 17 = "dezassete"
        | num == 18 = "dezoito"
        | num == 19 = "dezanove"
        | otherwise = error "10sp not supposed"

converteDec :: Int -> String
converteDec num
        | num < 10 = converteUni num
        | num3 == 10 = converteSpe num
        | num == 20 = "vinte"
        | num3 == 20 = "vinte e " ++ converteUni num2
        | num == 30 = "trinta"
        | num3 == 30 = "trinta e " ++ converteUni num2
        | num == 40 = "quarenta"
        | num3 == 40 = "quarenta e " ++ converteUni num2
        | num == 50 = "cinquenta"
        | num3 == 50 = "cinquenta e " ++ converteUni num2
        | num == 60 = "sessenta"
        | num3 == 60 = "sessenta e " ++ converteUni num2
        | num == 70 = "sessenta"
        | num3 == 70 = "setenta e " ++ converteUni num2
        | num == 80 = "oitenta"
        | num3 == 80 = "oitenta e " ++ converteUni num2
        | num == 90 = "noventa"
        | num3 == 90 = "noventa e " ++ converteUni num2
        | otherwise = error "10s not supposed"
            where num2 = num `mod` 10
                  num3 = num - num2

converteCent :: Int -> String
converteCent num
        | num < 100 = converteDec num
        | num == 100 = "cem" 
        | num3 == 100 = "cento e " ++ converteDec num2
        | num == 200 = "duzentos"
        | num3 == 200 = "duzentos e " ++ converteDec num2
        | num == 300 = "trezentos"
        | num3 == 300 = "trezentos e " ++ converteDec num2
        | num == 400 = "quatrocentos"
        | num3 == 400 = "quatrocentos e " ++ converteDec num2
        | num == 500 = "quinhentos"
        | num3 == 500 = "quinhentos e " ++ converteDec num2
        | num == 600 = "seiscentos"
        | num3 == 600 = "seiscentos e " ++ converteDec num2
        | num == 700 = "setessentos"
        | num3 == 700 = "setessentos e " ++ converteDec num2
        | num == 800 = "oitocentos"
        | num3 == 800 = "oitocentos e " ++ converteDec num2
        | num == 900 = "novecentos"
        | num3 == 900 = "novecentos e " ++ converteDec num2
        | otherwise = error "100s not supposed"
            where num2 = num `mod` 100
                  num3 = num - num2


converteMil :: Int -> String
converteMil num
        | num < 1000 = converteCent num2
        | num == 1000 = "mil"
        | num3 == 1000 && num2 < 100 = "mil e " ++ converteCent num2
        | num3 == 1000 = "mil " ++ converteCent num2
        | num == 2000 = "dois mil"
        | num3 == 2000 && num2 < 100 = "dois mil e " ++ converteCent num2
        | num3 == 2000 = "dois mil " ++ converteCent num2
        | num == 3000 = "tres mil"
        | num3 == 3000 && num2 < 100 = "tres mil e " ++ converteCent num2
        | num3 == 3000 = "tres mil " ++ converteCent num2
        | num == 4000 = "quatro mil"
        | num3 == 4000 && num2 < 100 = "quatro mil e " ++ converteCent num2
        | num3 == 4000 = "quatro mil " ++ converteCent num2
        | num == 5000 = "cinco mil"
        | num3 == 5000 && num2 < 100 = "cinco mil e " ++ converteCent num2
        | num3 == 5000 = "cinco mil " ++ converteCent num2
        | num == 6000 = "seis mil"
        | num3 == 6000 && num2 < 100 = "seis mil e " ++ converteCent num2
        | num3 == 6000 = "seis mil" ++ converteCent num2
        | num == 7000 = "sete mil"
        | num3 == 7000 && num2 < 100 = "sete mil e " ++ converteCent num2
        | num3 == 7000 = "sete mil " ++ converteCent num2
        | num == 8000 = "oito mil"
        | num3 == 8000 && num2 < 100 = "oito mil e " ++ converteCent num2
        | num3 == 8000 = "oito mil " ++ converteCent num2
        | num == 9000 = "nove mil"
        | num3 == 9000 && num2 < 100 = "nove mil e " ++ converteCent num2
        | num3 == 9000 = "nove mil " ++ converteCent num2
        | otherwise = error "100s not supposed"
            where num2 = num `mod` 1000
                  num3 = num - num2

converte :: Int -> String
converte num 
        | num < 0 = "menos " ++ converte (-num)
        | num < 10 = converteUni num
        | num < 100 = converteDec num
        | num < 1000 = converteCent num
        | num < 1000000 && num `mod` 1000 == 0 = converteCent (num `div` 1000) ++ " mil"
        | num < 1000000 && num `mod` 1000 < 100 = converteCent (num `div` 1000) ++ " mil e " ++ converteCent (num `mod` 1000)
        | num < 1000000 = converteCent (num `div` 1000) ++ " mil " ++ converteCent (num `mod` 1000)
        | num == 1000000 = "um milhao"
        | num > 1000000 = error "number too big"
        | otherwise = error "converte error"

main :: IO ()
main = do
    putStrLn "Aula Prática 1"
    print (classifica 17)