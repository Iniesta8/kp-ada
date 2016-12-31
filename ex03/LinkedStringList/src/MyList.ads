with Variable_Length255;
  use Variable_Length255;

package MyList is

  type list_element;
  type ptr_le is access list_element;

  type list_element is record
    value : Variable_String;
    next : ptr_le;
  end record;

  type list_head is record
    first : ptr_le;
    last : ptr_le;
    count : integer;
  end record;

  type ptr_lh is access list_head;

  procedure insert (head : in out list_head; value : in Variable_String);

  procedure print_list (head : in list_head);

end MyList;
