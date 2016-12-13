package body Filterpackage is

  function filter (v : ArrayInt; x : integer; p : predicate) return ArrayInt is
    temp : ArrayInt(v'range);
    j : integer := v'first;
  begin
    for element of v loop
      if p(x, element) then
        temp(j) := element;
        j := j+1;
      end if;
    end loop;

    return temp(v'first .. j-1);
  end filter;

end Filterpackage;
