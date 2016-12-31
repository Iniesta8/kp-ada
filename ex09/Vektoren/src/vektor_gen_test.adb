---------------------------------------------------------------------------
-- Programm    : D:\Arbeit\Ada\DAA\vektortest.adb
-- Verfasser   :
-- Datum       : 30.11.2003 23:04:
-- Beschreibung:
--             :
-- Eingabe     : Test des generischen Vektorpakets
-- Verarbeitung:
-- Ausgabe     :
-- Änderungen  :
---------------------------------------------------------------------------
with Ada.Text_IO;        use Ada.Text_IO;

with long_float_text_io; use long_float_text_io;


with long_vektoren;      use long_vektoren;
with long_vektoren_ea;   use long_vektoren_ea;



procedure vektor_gen_test is

   a : vektor := (3.0, 2.0, 1.0);
   b : vektor := (5.0, 4.0, -3.0);
   c : vektor (1 .. 3);
   d : vektor := (-4.0, 5.0, +3.0);
   e : long_float;

begin

   put("Vektor a:            ");
   Put (a);
   new_line;
   put("Vektor b:            ");
   Put (b);
   new_line;

   e := a * b;
   put("Vektor a * b:        ");
   Put (e, fore => 5, aft => 2, exp => 0);
   new_line;

   c := a-b;
   put("Vektor a - b:        ");
   Put (c);
   new_line;

   c := a+b;
   put("Vektor a + b:        ");
   Put (c);
   new_line;

   c := (a-b)-(a+b);
   put("Vektor (a-b)-(a+b):  ");
   Put (c);
   new_line;

   if gleiche_laenge(b,d) then
      put("b und d sind gleich lang, ");
   end if;
   if b /= d then
      put("aber nicht identisch.");
   end if;
   new_line;

   put ("Test des Exception-Mechanismus: ");
   put (a*(1.0,2.0,3.0,4.0));
   new_line;

exception

   when falsche_Indexgrenzen =>
      put("Ausnahme: <<<<<<<<<<<<<<<<<<<<");
      new_line;
      put("          >>>>>>>>>>  Falsche Indexgrenzen bei Vektoroperation.");
      new_line;

   when others =>
      null;

end vektor_gen_test;
