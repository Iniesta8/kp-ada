with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure CashRegister is

   f1 : float := 0.75;
   f2 : float := 0.80;

   ffactor : float := 0.0654;

   type fp is delta 0.01 digits 15;
   fp1 : fp := 0.75;
   fp2 : fp := 0.80;

   fpfactor : constant := 0.0654;

   i1 : integer := 75;
   i2 : integer := 80;

   fres : float;
   fpres : fp;
   ires : integer;

   package Dec_IO is new Ada.Text_IO.Decimal_IO(fp); use Dec_IO;

   function add_n_times(value : float; n : natural) return float is
     sum : float := 0.0;
   begin
     for i in 1 .. n loop
       sum := sum + value;
     end loop;
     return sum;
   end add_n_times;

   function add_n_times(value : fp; n : natural) return fp is
     sum : fp := 0.0;
   begin
     for i in 1 .. n loop
       sum := sum + value;
     end loop;
     return sum;
   end add_n_times;

   function add_n_times(value : integer; n : natural) return integer is
     sum : integer := 0;
   begin
     for i in 1 .. n loop
       sum := sum + value;
     end loop;
     return sum;
   end add_n_times;

begin

  put("Float addition:"); new_line;

  fres := add_n_times(f1, 10000);
  put("Result = "); put(fres, exp => 0);
  fres := ffactor * fres;
  put(" (Tax = "); put(fres, exp => 0); put(")"); new_line;

  fres := add_n_times(f2, 10000);
  put("Result = "); put(fres, exp => 0);
  fres := ffactor * fres;
  put(" (Tax = "); put(fres, exp => 0); put(")"); new_line;

  new_line;
  put("Fixed point (decimal) addition:"); new_line;

  fpres := add_n_times(fp1, 10000);
  put("Result = "); put(fpres);
  fpres := fpfactor * fpres;
  put(" (Tax = "); put(fpres, exp => 0); put(")"); new_line;

  fpres := add_n_times(fp2, 10000);
  put("Result = "); put(fpres);
  fpres := fpfactor * fpres;
  put(" (Tax = "); put(fpres, exp => 0); put(")"); new_line;

  new_line;
  put("Integer addition:"); new_line;

  ires := add_n_times(i1, 10000);
  put("Result = "); put(ires); new_line;

  ires := add_n_times(i2, 10000);
  put("Result = "); put(ires); new_line;

end CashRegister;
