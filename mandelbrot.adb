with Interfaces;
with Mandelbrot_Checker;

with Ada.Streams.Stream_IO;

procedure Mandelbrot is
   package IFS renames Interfaces;
   use type IFS.Integer_32;
   use type IFS.Unsigned_16;
   use type IFS.Unsigned_32;
   use type IFS.Unsigned_8;

   package Checker is new Mandelbrot_Checker (Max_Iterations => 1000);

   type Bitmap_Header is record
      Signature : String (1 .. 2);
      Size      : IFS.Unsigned_32;
      Reserved1 : IFS.Unsigned_16;
      Reserved2 : IFS.Unsigned_16;
      Offset    : IFS.Unsigned_32;
   end record;
   for Bitmap_Header use record
      Signature at 0 range 0 .. 15;
      Size      at 0 range 16 .. 47;
      Reserved1 at 0 range 48 .. 63;
      Reserved2 at 0 range 64 .. 79;
      Offset    at 0 range 80 .. 111;
   end record;

   type Bitmap_Info is record
      Struct_Size   : IFS.Unsigned_32;
      Width         : IFS.Integer_32;
      Height        : IFS.Integer_32;
      Planes        : IFS.Unsigned_16;
      Pixel_Size    : IFS.Unsigned_16;
      Compression   : IFS.Unsigned_32;
      Image_Size    : IFS.Unsigned_32;
      PPMX          : IFS.Integer_32;
      PPMY          : IFS.Integer_32;
      Palette_Size  : IFS.Unsigned_32;
      Important     : IFS.Unsigned_32;
   end record;

   type Pixel is record
      B, G, R : IFS.Unsigned_8;
   end record;

   use Ada.Streams;

   File : Stream_IO.File_Type;
   Stream : Stream_IO.Stream_Access;

   Width : constant := 600;
   Height : constant := 400;

   subtype Selection_Type is Integer range 0 .. 3;

   Cur : Pixel;
   Cur_Iterations : Positive;
   Steps : IFS.Unsigned_8;

   Padding_Bytes : constant IFS.Unsigned_32 :=
     (4 - (Bitmap_Header'Size + Bitmap_Info'Size) / 8 mod 4) mod 4;
begin
   Stream_IO.Create (File, Stream_IO.Out_File, "mandelbrot.bmp");
   Stream := Stream_IO.Stream (File);

   Bitmap_Header'Write (Stream, (
      Signature => "BM", Size =>
        (Bitmap_Header'Size + Bitmap_Info'Size +
         Pixel'Size * Width * Height) / 8 + Padding_Bytes,
      Offset => (Bitmap_Header'Size + Bitmap_Info'Size) / 8 + Padding_Bytes,
      others => 0
   ));
   Bitmap_Info'Write (Stream, (
      Struct_Size => Bitmap_Info'Size / 8, Width => Width, Height => Height,
      Planes => 1, Pixel_Size => Pixel'Size, Compression => 0, Image_Size => 0,
      PPMX => 42, PPMY => 42, Palette_Size => 0, Important => 0
   ));

   for I in 1 .. Padding_Bytes loop
      --  insert padding so pixels are DWORD-aligned
      IFS.Unsigned_8'Write (Stream, 0);
   end loop;

   for Y in 0 .. Height - 1 loop
      for X in 0 .. Width - 1 loop
         Cur_Iterations := Checker.Iterate (
            (Re => Long_Float (X) / Long_Float (Width) * 3.0 - 2.0,
             Im => Long_Float (Y) / Long_Float (Height) * 2.0 - 1.0));
         if Cur_Iterations > 1000 then
            Cur := (others => 0);
         else
            Steps := IFS.Unsigned_8 ((Cur_Iterations mod 25) * 10);
            case Selection_Type ((Cur_Iterations mod 100) / 25) is
            when 0 => Cur := (R => Steps, G => 0, B => 255 - Steps);
            when 1 => Cur := (R => 255, G => Steps, B => 0);
            when 2 => Cur := (R => 255 - Steps, G => 255, B => 0);
            when 3 => Cur := (R => 0, G => 255 - Steps, B => Steps);
            end case;
         end if;
         Pixel'Write (Stream, Cur);
      end loop;
   end loop;

   Stream_IO.Close (File);
end Mandelbrot;