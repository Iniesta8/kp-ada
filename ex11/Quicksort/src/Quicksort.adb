
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Predicates; use Predicates;
with Filterpackage; use Filterpackage;
with Ada.Numerics.Discrete_Random;

procedure Quicksort is

  function sort (xs : ArrayInt) return ArrayInt is
    pivot : integer;
  begin
    if (xs'length <= 1) then
      return xs;
    else
      pivot := xs(xs'length / 2);
      return sort(filter(xs, pivot, greater)) & filter(xs, pivot, equal) & sort(filter(xs, pivot, less));
    end if;
  end sort;

  subtype myint10000 is integer range -10_000..10_000;
  package myrand is new Ada.Numerics.Discrete_Random(myint10000);
  use myrand;

  g10000 : myrand.generator;

  test_data : constant ArrayInt(1..200) := (others => Random(g10000));
  result : ArrayInt(test_data'range);

begin

  result := sort(test_data);
  put ("Before sort: "); new_line;
  for element of test_data loop
    put(element); new_line;
  end loop;
  new_line;
  put ("After sort: "); new_line;
  for element of result loop
    put(element); new_line;
  end loop;

end Quicksort;
