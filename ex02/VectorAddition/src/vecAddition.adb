with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure vecAddition is

  type vector is array (integer range <>) of float;

  a : vector (1 .. 3) := (1.0, 2.0, 3.0);
  b : vector (1 .. 3) := (3.0, 2.0, 1.0);

  function "+" (v1 : vector; v2 : vector) return vector is
    result : vector (1 .. 3) := (0.0, 0.0, 0.0);
  begin
    for i in v1'range loop
      result(i) := a(i) + b(i);
    end loop;
    return result;
  end "+";

  res : vector (1 .. 3);

begin
  Ada.Text_IO.put("Result =");
  res := a + b;
  for i in res'range loop
    Ada.Float_Text_IO.put(res(i), exp => 0);
    Ada.Text_IO.put(" ");
  end loop;

end vecAddition;
