with Ada.Text_IO;
  use Ada.Text_IO;
with Ada.Float_Text_IO;
  use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
  use Ada.Integer_Text_IO;

procedure linkedList is

  type list_element;
  type ptr_le is access list_element;

  type list_element is record
    value : integer;
    next : ptr_le;
  end record;

  type list_head is record
    first : ptr_le;
    last : ptr_le;
    count : integer;
  end record;

  type ptr_lh is access list_head;

  procedure insert (value : in integer; head : in out list_head) is
    tmp : ptr_le := new list_element'(value, null);
    help : ptr_le;
  begin
    if head.first = null or head.count = 0 then  -- list is empty
      head.first := tmp;
      head.last := tmp;
    elsif head.first.value > tmp.value then  -- push front
      tmp.next := head.first;
      head.first := tmp;
    else
      help := head.first;

      while help.next /= null loop
        if tmp.value >= help.next.value then
          help := help.next;
        else exit;
        end if;
      end loop;  -- loop ends when insertion position was found

      if help.next = null then  -- push back
        head.last := tmp;
      end if;

      tmp.next := help.next;
      help.next := tmp;
    end if;
    head.count := head.count + 1;

  end insert;

  procedure print_list (head : in list_head) is
    help : ptr_le := head.first;
  begin
    if help = null then
      put_line("List is empty.");
    end if;

    while help /= null loop
      put(help.value); new_line;
      help := help.next;
    end loop;
  end print_list;

  myList : list_head;
begin
  -- insert some elements
  insert(1, myList);
  insert(-1, myList);
  insert(1, myList);
  insert(2, myList);
  insert(-2, myList);
  insert(0, myList);

  -- print out list information and elements
  put("Num of elements: "); put(myList.count); new_line;
  if myList.count >= 1 then
    put("First element:   "); put(myList.first.value); new_line;
    put("Last element:    "); put(myList.last.value); new_line;
  end if;
  put("Elements: "); new_line;

  print_list(myList);



end linkedList;
