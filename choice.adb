package body Choice is
   type Antwort_Liste is array (Frage_Type) of Antwort_Type;

   Antworten : Antwort_Liste;

   function Antwort (Frage : Frage_Type) return Antwort_Type is begin
      return Antworten (Frage);
   end Antwort;
begin
   --  Tragen Sie hier Ihre Antworten ein

   Antworten (1) := Nein;
   Antworten (2) := Ja;
   Antworten (3) := Ja;
   Antworten (4) := Unbeantwortet;
   Antworten (5) := Unbeantwortet;
   Antworten (6) := Unbeantwortet;
   Antworten (7) := Unbeantwortet;
   Antworten (8) := Ja;
   Antworten (9) := Nein;
   Antworten (10) := Ja;
   Antworten (11) := Nein;
   Antworten (12) := Ja;
   Antworten (13) := Ja;
   Antworten (14) := Nein;
end Choice;
