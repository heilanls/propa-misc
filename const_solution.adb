package body Const_Solution is
   --  Aendern Sie die Deklarationen nicht!
   type Zeile is array (Zeilen) of Antworten;

   L : array (Aufgaben) of Zeile := (others => (others => E));

   --  Aendern Sie die Funktion nicht!
   function Get (A : Aufgaben; Z : Zeilen) return Antworten is begin
      return L (A) (Z);
   end Get;
begin
   --  Tragen Sie hier Ihre Antworten ein:
   --  Aendern Sie nur die Enum-Werte, sonnst nichts!

   --  TA (A);
   L (1)  := (N, J, N, J, N);

   --  TA (B);
   L (2)  := (J, N, J, N, J);


   --  TB (C);
   L (3)  := (N, J, N, J, N);

   --  TB (D);
   L (4)  := (J, N, J, N, J);


   --  TC (A);
   L (5)  := (J, J, J, J, J);

   --  TC (B);
   L (6)  := (J, J, J, J, J);


   --  TD (C);
   L (7)  := (J, J, J, J, J);

   --  TD (D);
   L (8)  := (J, J, J, J, J);


   --  TE (A'Access);
   L (9)  := (J, J, J, J, J);

   --  TE (B'Access);
   L (10) := (J, J, J, J, J);
end Const_Solution;
