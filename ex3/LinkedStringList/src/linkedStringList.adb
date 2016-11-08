with MyList; use MyList;
with Ada.Text_IO;
  use Ada.Text_IO;
with Ada.Float_Text_IO;
  use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
  use Ada.Integer_Text_IO;
with variable_length255.IO;
  use variable_length255.IO;
with Variable_Length255;
  use Variable_Length255;

procedure linkedStringList is
  myListHead : list_head; -- TODO: allocate list_head maybe on heap

  begin
    -- insert some elements
    insert(myListHead, To_Variable_String("Hallo"));
    insert(myListHead, To_Variable_String("Welt"));
    insert(myListHead, To_Variable_String("Rosenheim"));
    insert(myListHead, To_Variable_String("Servus"));
    insert(myListHead, To_Variable_String("World"));

    -- print out list information and elements
    put("Num of elements: "); put(myListHead.count); new_line;
    if myListHead.count >= 1 then
      put("First element:   "); put(myListHead.first.value); new_line;
      put("Last element:    "); put(myListHead.last.value); new_line;
    end if;
    put("Elements: "); new_line;

    print_list(myListHead);

end linkedStringList;
