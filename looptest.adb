with Ada.Integer_Text_IO;
with Ada.Text_IO;

procedure looptest is
  n : integer := 4;
begin
  for i in 1..n loop
    Ada.Integer_Text_IO.put(i);
    n := 10 * n;
    Ada.Text_IO.new_line;
  end loop;

end looptest;
