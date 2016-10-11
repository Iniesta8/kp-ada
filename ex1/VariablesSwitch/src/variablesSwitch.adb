with Ada.Integer_Text_IO;
with Ada.Text_IO;

procedure variablesSwitch is
  x : integer := 5;
  y : integer := 3;

  procedure varSwitch (x : in out integer;
                       y : in out integer) is
    help : integer;
  begin
    help := x;
    x := y;
    y := help;
  end varSwitch;

begin

  Ada.Text_IO.put("Before switch:");
  Ada.Text_IO.new_line(1);
  Ada.Text_IO.put("x = ");
  Ada.Integer_Text_IO.put (x);
  Ada.Text_IO.new_line(1);
  Ada.Text_IO.put("y = ");
  Ada.Integer_Text_IO.put (y);

  varSwitch(x, y);

  Ada.Text_IO.new_line(2);
  Ada.Text_IO.put("After switch:");
  Ada.Text_IO.new_line(1);
  Ada.Text_IO.put("x = ");
  Ada.Integer_Text_IO.put(x);
  Ada.Text_IO.new_line(1);
  Ada.Text_IO.put("y = ");
  Ada.Integer_Text_IO.put(y);

end variablesSwitch;
