
generic
  type numtyp is private;
  nullelement : numtyp;

  with function "*" (l, r : numtyp) return numtyp is <>;
  with function "/" (l, r : numtyp) return numtyp is <>;
  with function "-" (n : numtyp) return numtyp is <>;
  with function "+" (l, r : numtyp) return numtyp is <>;
  -- with function "-" (l, r : numtyp) return numtyp is <>;
  with function "<" (l, r : numtyp) return boolean is <>;
  with function ">" (l, r : numtyp) return boolean is <>;

package Vektoren is
  type vektor is array (integer range <>) of numtyp;
  type zeilenvektor is array (integer range <>) of numtyp;

  falsche_Indexgrenzen : exception;

  function "*" (l : vektor; r : numtyp) return vektor;
  function "*" (l : numtyp; r : vektor) return vektor;
  function "/" (l : vektor; r : numtyp) return vektor;
  function "-" (v : vektor) return vektor;
  function "+" (l,r : vektor) return vektor;
  function "-" (l,r : vektor) return vektor;
  function "*" (l,r : vektor) return numtyp;
  function "*" (l : zeilenvektor; r : vektor) return numtyp;
  function transp (v : vektor) return zeilenvektor;
  function transp (v : zeilenvektor) return vektor;
  function "<" (l,r : vektor) return boolean;
  function ">" (l,r : vektor) return boolean;
  function "<=" (l,r : vektor) return boolean;
  function ">=" (l,r : vektor) return boolean;
  function gleiche_laenge (l,r : vektor) return boolean;

end Vektoren;
