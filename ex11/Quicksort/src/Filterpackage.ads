with Predicates; use Predicates;

package Filterpackage is

  type ArrayInt is array (natural range <>) of integer;

  function filter (v : ArrayInt; x : integer; p : predicate) return ArrayInt;

end Filterpackage;
