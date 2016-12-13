package Predicates is
  type predicate is access function (l, r : integer) return boolean;

  function greater_operator (l, r : integer) return boolean is (l > r);
  function equal_operator (l, r : integer) return boolean is (l = r);
  function less_operator (l, r : integer) return boolean is (l < r);

  greater : constant predicate := greater_operator'access;
  equal : constant predicate := equal_operator'access;
  less : constant predicate := less_operator'access;

end Predicates;
