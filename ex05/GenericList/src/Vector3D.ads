
package Vector3D is

  type Vector is array (1 .. 3) of float;

  function ">" (x, y : Vector) return boolean;
  function ">=" (x, y : Vector) return boolean;

  procedure put (x : in Vector);

end Vector3D;
