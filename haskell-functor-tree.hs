module Exercicio41 where 

{- 
Exercício 4.1 (Como instancia de funtor)
Usando a estrutura de árvore, monte uma função mapA (fmap), que jogue uma função passada por 
parâmetro para todos os elementos de uma árvore. Deixe explícito o tipo desta função.
-}


--Tipo Arvore: 
data Arvore a = ArvoreVazia | Nodo a (Arvore a) (Arvore a) deriving (Show, Eq, Read, Ord)


--Instancia de Funtor
instance Functor Arvore where  
    -- Tipo da Funcao: 
    -- fmap :: Functor f => (a -> b) -> f a -> f b
    fmap f ArvoreVazia = ArvoreVazia
    fmap f (Nodo x esq dir) = Nodo (f x) (fmap f esq) (fmap f dir) 


--Arvore
--------
--(Nodo 50 (Nodo 30 (Nodo 20 (ArvoreVazia) (ArvoreVazia))  (Nodo 40 (ArvoreVazia) (ArvoreVazia))) (Nodo 90 (ArvoreVazia) (Nodo 100 (ArvoreVazia)(ArvoreVazia))))


--ghc:
-------
-- let tree = (Nodo 50 (Nodo 30 (Nodo 20 (ArvoreVazia) (ArvoreVazia))  (Nodo 40 (ArvoreVazia) (ArvoreVazia))) (Nodo 90 (ArvoreVazia) (Nodo 100 (ArvoreVazia)(ArvoreVazia))))
-- :t Tree
-- tree :: Arvore Integer


--Testes:
---------
--Exercicio41> fmap (\x -> x+5) tree
--Retorna: Nodo 55 (Nodo 35 (Nodo 25 ArvoreVazia ArvoreVazia) (Nodo 45 ArvoreVazia ArvoreVazia)) (Nodo 95 ArvoreVazia (Nodo 105 ArvoreVazia ArvoreVazia))


--Exercicio41> fmap (\x -> x*x) tree
--Nodo 2500 (Nodo 900 (Nodo 400 ArvoreVazia ArvoreVazia) (Nodo 1600 ArvoreVazia ArvoreVazia)) (Nodo 8100 ArvoreVazia (Nodo 10000 ArvoreVazia ArvoreVazia))


--Exercicio41> fmap (*3) tree
--Nodo 150 (Nodo 90 (Nodo 60 ArvoreVazia ArvoreVazia) (Nodo 120 ArvoreVazia ArvoreVazia)) (Nodo 270 ArvoreVazia (Nodo 300 ArvoreVazia ArvoreVazia))