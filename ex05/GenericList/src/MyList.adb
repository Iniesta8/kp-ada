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

package body MyList is

  procedure insert (head : in out list_head; value : in GenericListValue) is
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
      put(help.value); put("  ");
      help := help.next;
    end loop;
  end print_list;

  function get_length (head : in list_head) return natural is
  begin
    return head.count;
  end get_length;

  function get_first (head : in list_head) return GenericListValue is
  begin
    return head.first.all.value;
  end get_first;

  function get_last (head : in list_head) return GenericListValue is
  begin
    return head.last.all.value;
  end get_last;

end MyList;
