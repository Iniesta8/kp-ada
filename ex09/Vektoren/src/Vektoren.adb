
package body Vektoren is

  function "*" (l : vektor; r : numtyp) return vektor is
    ergebnis : vektor := l;
  begin
    for i in ergebnis'range loop
      ergebnis(i) := ergebnis(i) * r;
    end loop;
    return ergebnis;
  end "*";

  function "*" (l : numtyp; r : vektor) return vektor is
  begin
    return r * l;
  end "*";

  function "/" (l : vektor; r : numtyp) return vektor is
    ergebnis : vektor := l;
  begin
    for i in ergebnis'range loop
      ergebnis(i) := ergebnis(i) / r;
    end loop;
    return ergebnis;
  end "/";

  function "-" (v : vektor) return vektor is
    ergebnis : vektor := v;
  begin
    for i in ergebnis'range loop
      ergebnis(i) := -ergebnis(i);
    end loop;
    return ergebnis;
  end "-";

  function "+" (l,r : vektor) return vektor is
    ergebnis : vektor := l;
  begin
    for i in ergebnis'range loop
      ergebnis(i) := l(i) + r(i);
    end loop;
    return ergebnis;
  end "+";

  function "-" (l,r : vektor) return vektor is
  begin
    return l + (-r);
  end "-";

  function "*" (l,r : vektor) return numtyp is
    ergebnis : numtyp := nullelement;
  begin
    for i in l'range loop
      ergebnis := ergebnis + l(i) * r(i);
    end loop;
    return ergebnis;
  end "*";

  function "*" (l : zeilenvektor; r : vektor) return numtyp is
  begin
    return transp(l) * r;
  end "*";

  function transp (v : vektor) return zeilenvektor is
  begin
    return zeilenvektor(v);
  end transp;

  function transp (v : zeilenvektor) return vektor is
  begin
    return vektor(v);
  end transp;

  function "<" (l,r : vektor) return boolean is
  begin
    return l * l < r * r;
  end "<";

  function ">" (l,r : vektor) return boolean is
  begin
    return r < l;
  end ">";

  function "<=" (l,r : vektor) return boolean is
  begin
    return not (l > r);
  end "<=";

  function ">=" (l,r : vektor) return boolean is
  begin
    return not (l < r);
  end ">=";

  function gleiche_laenge (l,r : vektor) return boolean is
  begin
    return l * l = r * r;
  end gleiche_laenge;

end Vektoren;
