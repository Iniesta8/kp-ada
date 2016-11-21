with Ada.Text_IO;
  use Ada.Text_IO;
with Ada.Float_Text_IO;
  use Ada.Float_Text_IO;

package body Vector3D is

  function ">" (x, y : Vector) return boolean is
    length_x : float := 0.0;
    length_y : float := 0.0;
  begin
    for i in Vector'range loop
      length_x := length_x + x(i)**2;
      length_y := length_y + y(i)**2;
    end loop;
    return (length_x > length_y);
  end ">";

  function ">=" (x, y : Vector) return boolean is
    length_x : float := 0.0;
    length_y : float := 0.0;
  begin
    for i in Vector'range loop
      length_x := length_x + x(i)**2;
      length_y := length_y + y(i)**2;
    end loop;
    return (length_x >= length_y);
  end ">=";

  procedure put (x : in Vector) is
  begin
    put("[");
    for i in Vector'range loop
      put(x(i), fore => 2, aft => 3, exp => 0);
    end loop;
    put(" ]");
    -- new_line;
  end put;

end Vector3D;
