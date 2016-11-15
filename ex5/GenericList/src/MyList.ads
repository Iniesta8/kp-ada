with Variable_Length255;
  use Variable_Length255;

generic
  type GenericListValue is private;
  with function ">" (x, y : GenericListValue) return boolean is <>;
  with function ">=" (x, y : GenericListValue) return boolean is <>;
  with procedure put (x: in GenericListValue) is <>;

package MyList is

  type ptr_le is private;
  type list_head is private;

  procedure insert (head : in out list_head; value : in GenericListValue);

  procedure print_list (head : in list_head);

  function get_length (head : in list_head) return natural;
  function get_first (head : in list_head) return GenericListValue;
  function get_last (head : in list_head) return GenericListValue;

private

  type list_element;
  type ptr_le is access list_element;
  -- type ptr_lh is access list_head;

  type list_element is record
    value : GenericListValue;
    next : ptr_le;
  end record;

  type list_head is record
    first : ptr_le := null;
    last : ptr_le := null;
    count : natural := 0;
  end record;

end MyList;
