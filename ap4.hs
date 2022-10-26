--4

data Arv a = Vazia | No a (Arv a ) (Arv a)

--4.1
--Input example: sumArv (No 5 (No 3 Vazia Vazia) (No 8 (No 7 Vazia Vazia) (No 19 (No 12 Vazia Vazia) Vazia)))

sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No a left right) = a + sumArv left + sumArv right


--4.2
--Input example: listar (No 5 (No 3 Vazia Vazia) (No 8 (No 7 Vazia Vazia) (No 19 (No 12 Vazia Vazia) Vazia)))

listar :: Arv a -> [a]
listar Vazia = []
listar (No a left right) = listar right ++ [a] ++ listar left


--4.3
--Input example: nivel 2 (No 5 (No 3 Vazia Vazia) (No 8 (No 7 Vazia Vazia) (No 19 (No 12 Vazia Vazia) Vazia)))

nivel :: Int -> Arv a -> [a]
nivel 0 (No arv left right) = [arv]
nivel num Vazia = []
nivel num (No arv left right) = nivel (num - 1) left ++ nivel (num - 1) right


--4.4
--Input example: listar (mapArv (\a -> a+4) (No 5 (No 3 Vazia Vazia) (No 8 (No 7 Vazia Vazia) (No 19 (No 12 Vazia Vazia) Vazia))))

mapArv :: (a -> b) -> Arv a -> Arv b
mapArv f Vazia = Vazia
mapArv f (No a left right) = (No (f a) (mapArv f left) (mapArv f right))


--4.5

treeHeight :: Arv a -> Int
treeHeight Vazia = 0
treeHeight (No arv left right) = max (1 + treeHeight left) (1 + treeHeight right)
 
-- a)
--Input example: treeHeight (construirA [1 .. 100])
construirA :: [a] -> Arv a
construirA [] = Vazia
construirA l = (No (l !! (length (l)`div`2) ) (construirA (take (length (l)`div`2) l)) (construirA (drop ((length (l)`div`2)+1) l )))

-- b)
--Input example: treeHeight (construirB Vazia [8,6,4,16,1,2,9])
construirB :: Foldable t => Arv Int -> t Int -> Arv Int
construirB a l = foldr (insert) a l

--Input example: listar (insert 16 (No 5 (No 3 Vazia Vazia) (No 8 (No 7 Vazia Vazia) (No 19 (No 12 Vazia Vazia) Vazia))))
insert :: Int -> Arv Int -> Arv Int
insert num Vazia = (No num Vazia Vazia)
insert num (No a left right)
        | num > a = (No a left (insert num right))
        | num < a = (No a (insert num left) right)
        | num == a = (No a left right)


--4.6

-- a)
--Input example: mais_dir (No 5 (No 3 Vazia Vazia) (No 8 (No 7 Vazia Vazia) (No 19 (No 12 Vazia Vazia) Vazia)))
mais_dir :: Arv a -> a
mais_dir (No a left Vazia) = a
mais_dir (No a left right) = mais_dir right

--b)
--Input example: listar (remover 19 (No 8 (No 5 (No 2 Vazia Vazia) (No 7 Vazia Vazia)) (No 14 (No 10 Vazia Vazia) (No 19 (No 12 Vazia (No 18 Vazia Vazia)) (No 24 Vazia Vazia)))))
remover :: Ord a => a -> Arv a -> Arv a
remover num (No a left right) | a == num = Vazia
remover num (No a Vazia Vazia) = (No a Vazia Vazia)
remover num (No a left right) | num <= (mais_dir left) = (No a (remover num left) right)
remover num (No a left right) = (No a left (remover num right))


--4.7
--Input example: quatrosete

quatrosete :: IO()
quatrosete = do
        input <- getLine
        putStrLn (reverse input)

--4.8
--Input example: adivinha "sopa"

tentativa :: Int -> String -> String -> IO()
tentativa try secret progress
        | secret == progress = do
                putStrLn progress
                putStrLn ("Congrats you found " ++ secret ++ " it in " ++ (show try) ++ " tries")
        | otherwise = do
                putStrLn progress
                putStr "Input: "
                input <- getChar
                putStr "\n"
                tentativa (try + 1) secret [if ((secret !! idx) == input || (progress !! idx) /= '-') then (secret !! idx) else '-' | idx <- [0 .. ((length secret) - 1)]]

adivinha :: String -> IO()
adivinha secret = do
        tentativa 0 secret ['-'| x<-[0..((length secret)-1)]]


--4.9
--Input example: elefantes 5

elefantesAux :: Int -> Int -> IO()
elefantesAux now obj 
        | now == obj = do
                putStrLn ("Se " ++ (show (now-1)) ++ " elefantes incomodam muita gente,")
                putStrLn ((show now) ++ " elefantes incomodam muito mais!")
        | otherwise = do
                putStrLn ("Se " ++ (show (now-1)) ++ " elefantes incomodam muita gente,")
                putStrLn ((show now) ++ " elefantes incomodam muito mais!")
                elefantesAux (now+1) obj

elefantes :: Int -> IO()
elefantes num 
        | num > 2 = do
                elefantesAux 3 num
        | otherwise = putStrLn "Error"

--4.10
--Input example: nim

nimLogic :: [Int] -> IO()
nimLogic queues 
        | (length [True | x <- [0 .. 4], (queues !! x) == 0] == 5) = do
                putStrLn "Game Finished!"
        | otherwise = do
                putStrLn ("1:  " ++ (concat ["* "| x<- [1.. (queues !! 0)]]))
                putStrLn ("2:  " ++ (concat ["* "| x<- [1.. (queues !! 1)]]))
                putStrLn ("3:  " ++ (concat ["* "| x<- [1.. (queues !! 2)]]))
                putStrLn ("4:  " ++ (concat ["* "| x<- [1.. (queues !! 3)]]))
                putStrLn ("5:  " ++ (concat ["* "| x<- [1.. (queues !! 4)]]))
                putStr "Remove from which column: "
                col <- getChar
                putStr "\n"
                putStr "How many do you wish to remove: "
                qtd <- getChar
                putStr "\n"
                if ((read [col]) < 1 || (read [col]) > 5) then ()
                        nimLogic queues
                else if ((read [qtd]) <= 0 || (read [qtd]) > (queues !! ((read [col])-1))) then
                        nimLogic queues
                else
                        nimLogic [if (x == ((read [col])-1)) then (queues !! ((read [col])-1)) - (read [qtd]) else queues !! x|x <- [0 .. 4]]



nim :: IO()
nim = do
        nimLogic [5, 4, 3, 2, 1]

--4.11
-- Doesn't look that fun tbh, its pretty much ap2.hs 2.15 exercise 