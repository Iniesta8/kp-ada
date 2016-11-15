with PersonList; use PersonList;
with Person; use Person;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with variable_length255.IO; use variable_length255.IO;
with Variable_Length255; use Variable_Length255;

procedure genericList is
  myListHead : list_head;
  bob : Person.Person := (name => To_Variable_String("Bob"), nr => 123);
  alice : Person.Person := (name => To_Variable_String("Alice"), nr => 345);
  joseph : Person.Person := (name => To_Variable_String("Joseph"), nr => 123);

  firstPerson : Person.Person;
  lastPerson : Person.Person;

begin
  -- insert some persons
  insert(myListHead, bob);
  insert(myListHead, alice);
  insert(myListHead, joseph);

  -- print out list information and elements
  put("Num of elements:"); put(get_length(myListHead)); new_line;
  if get_length(myListHead) >= 1 then
    firstPerson := get_first(myListHead);
    lastPerson := get_last(myListHead);
    put("First element:            "); put(firstPerson.name); new_line;
    put("Last element:             "); put(lastPerson.name); new_line;
  end if;
  new_line; put("Elements: "); new_line;

  print_list(myListHead);

end genericList;
