with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Text_IO;

procedure dotProduct is

  type vector is array (integer range <>) of float;

  a : vector (1 .. 3) := (1.0, 2.0, 3.0);
  b : vector (1 .. 3) := (3.0, 2.0, 1.0);

  function "*" (v1 : vector;
                v2 : vector) return float is
    result : float := 0.0;
  begin
    if not (v1'length=v2'length) then raise Constraint_Error; end if;
    for i in v1'range loop
      result := result + v1(i) * v2(i);
    end loop;
    return result;
  end "*";

  res : float;

begin

  Ada.Text_IO.put("Result is: ");
  res := a * b;
  Ada.Float_Text_IO.put(res, exp => 0);

end dotProduct;
