data Farbe = Rot | Schwarz | Gelb | Blau | Bunt
   deriving (Show, Eq)

data Flaggenmast =
      Ende
   |  Flagge Farbe
   |  Mast Flaggenmast Flaggenmast
   deriving (Show, Eq)

beispielmast :: Flaggenmast
beispielmast = Mast Ende (Mast (Flagge Schwarz) (Flagge Schwarz))

fold_mast :: (a -> a -> a) -> (Farbe -> a) -> a -> Flaggenmast -> a
fold_mast m f e = fold_mast'
      where fold_mast' Ende = e
            fold_mast' (Flagge c) = f c
            fold_mast' (Mast links rechts) = m (fold_mast' links) (fold_mast' rechts)

flaggen :: Flaggenmast -> Int
flaggen mast = fold_mast m f 0 mast
      where m a b = a + b 
            f c = 1
            
flaggenfarben :: Flaggenmast -> [Farbe]
flaggenfarben mast = fold_mast m f [] mast
      where m a b = a ++ b 
            f c = c:[]

farbwert :: Farbe -> Int
farbwert farbe 
      |farbe == Rot = 1
      |farbe == Schwarz = 5
      |farbe == Gelb = 9
      |farbe == Blau = 3
      |farbe == Bunt = 0

mastwert :: Flaggenmast -> Int --funktioniert
mastwert mast = fold_mast m farbwert (-1) mast
      where m a b = a + b

vielfarbig :: Flaggenmast -> Bool --funktioniert
vielfarbig mast = fold_mast m f False mast
      where m a b = if ( a == False && b == False ) then False else True
            f c = if c == Bunt then True else False 