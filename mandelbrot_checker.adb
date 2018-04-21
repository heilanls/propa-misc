package body Mandelbrot_Checker is
   function Iterate (C : Complex_Types.Complex) return Positive is
      use type Complex_Types.Complex;
      Z : Complex_Types.Complex := (Re => 0.0, Im => 0.0);
      I : Integer := 1;
   begin
      --  TODO: Iterationen implementieren
      while I <= Max_Iterations loop
         Z := Z**2 + C;
         if abs (Z) > 2.0 then
            return I;
         else
            null;
         end if;
         I := I + 1;
      end loop;
      return Max_Iterations + 1;
   end Iterate;
end Mandelbrot_Checker;