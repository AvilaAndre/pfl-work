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