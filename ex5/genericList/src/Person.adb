with Variable_Length255;
  use Variable_Length255;
with variable_length255.IO;
  use variable_length255.IO;

package body Person is

  function ">" (x, y : Person) return boolean is
  begin
    return (x.nr > y.nr);
  end ">";

  function ">=" (x, y : Person) return boolean is
  begin
    return (x.nr >= y.nr);
  end ">=";

  procedure put (x : in Person) is
  begin
    put (x.name);
  end put;

end Person;
