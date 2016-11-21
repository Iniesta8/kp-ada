with PersonList; use PersonList;
with Vector3DList; use Vector3DList;
with Person; use Person;
with Vector3D; use Vector3D;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with variable_length255.IO; use variable_length255.IO;
with Variable_Length255; use Variable_Length255;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure genericList is
  -- create lists
  myPersonListHead : PersonList.list_head;
  myVector3DListHead : Vector3DList.list_head;

  -- create some test persons
  bob : Person.Person := (name => To_Variable_String("Bob"), nr => 123);
  alice : Person.Person := (name => To_Variable_String("Alice"), nr => 345);
  foo : Person.Person := (name => To_Variable_String("Foo"), nr => 123);
  bar : Person.Person := (name => To_Variable_String("Bar"), nr => -42);

  firstPerson : Person.Person;
  lastPerson : Person.Person;

  -- create some test vectores
  v1 : Vector3D.Vector := (1.0, 2.0, 3.0);
  v2 : Vector3D.Vector := (3.0, 2.0, 1.0);
  v3 : Vector3D.Vector := (1.5, 1.5, 1.5);
  v4 : Vector3D.Vector := (3.0, 6.0, 9.0);

  firstVector : Vector3D.Vector;
  lastVector : Vector3D.Vector;

  procedure print_line is
    line : string := 50 * '-';
  begin
    put(line); new_line;
  end print_line;

begin
  -- insert some persons
  insert(myPersonListHead, bob);
  insert(myPersonListHead, alice);
  insert(myPersonListHead, foo);
  insert(myPersonListHead, bar);

  -- insert some vectores
  insert(myVector3DListHead, v1);
  insert(myVector3DListHead, v2);
  insert(myVector3DListHead, v3);
  insert(myVector3DListHead, v4);

  -- print out list information and elements of person list_head
  print_line;
  put("MyPersonList:"); new_line;
  print_line;
  put("Num of elements:"); put(get_length(myPersonListHead)); new_line;
  if get_length(myPersonListHead) >= 1 then
    firstPerson := get_first(myPersonListHead);
    lastPerson := get_last(myPersonListHead);
    put("First element:            "); put(firstPerson.name); new_line;
    put("Last element:             "); put(lastPerson.name); new_line;
  end if;
  new_line; put("Elements: "); new_line;

  print_list(myPersonListHead);

  new_line;
  new_line;

  print_line;
  put("MyVector3DList:"); new_line;
  print_line;
  put("Num of elements:"); put(get_length(myVector3DListHead)); new_line;
  if get_length(myVector3DListHead) >= 1 then
    firstVector := get_first(myVector3DListHead);
    lastVector := get_last(myVector3DListHead);
    put("First element:            "); put(firstVector); new_line;
    put("Last element:             "); put(lastVector); new_line;
  end if;
  new_line; put("Elements: "); new_line;

  print_list(myVector3DListHead);

end genericList;
