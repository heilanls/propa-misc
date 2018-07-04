data Farbe = Rot | Schwarz | Gelb | Blau | Bunt
   deriving (Show, Eq)

data Flaggenmast =
      Ende
   |  Flagge Farbe
   |  Mast Flaggenmast Flaggenmast
   deriving (Show, Eq)

beispielmast :: Flaggenmast
beispielmast = Mast (Mast (Flagge Schwarz) (Flagge Schwarz)) Ende

fold_mast :: (a -> a -> a) -> (Farbe -> a) -> a -> Flaggenmast -> a
fold_mast m f e = fold_mast'
      where 
            fold_mast' Ende = e
            fold_mast' (Flagge c) = f c
            fold_mast' (Mast child1 child2) = m (fold_mast' child1) (fold_mast' child2)


flaggen :: Flaggenmast -> Int
flaggen mast = fold_mast m farbwert Ende
            where m a b

--flaggenfarben :: Flaggenmast -> [Farbe]

farbwert :: Farbe -> Int
farbwert farbe
      | farbe == Rot = 1
      | farbe == Schwarz = 5
      | farbe == Gelb = 9
      | farbe == Blau = 3
      | farbe == Bunt = 0

--mastwert :: Flaggenmast -> Int

--vielfarbig :: Flaggenmast -> Bool
