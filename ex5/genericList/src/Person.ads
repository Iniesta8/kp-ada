with Variable_Length255;
  use Variable_Length255;

package Person is

  type Person is record
    name : Variable_String;
    nr : integer;
  end record;

  function ">" (x, y : Person) return boolean;
  function ">=" (x, y : Person) return boolean;

  procedure put (x : in Person);

end Person;
