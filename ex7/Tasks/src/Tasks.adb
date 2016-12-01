with Ada.Text_IO;
  use Ada.Text_IO;
with Ada.Integer_Text_IO;
  use Ada.Integer_Text_IO;
with Ada.Real_Time;
  use Ada.Real_Time;
with Ada.Calendar.Formatting;
  use Ada.Calendar.Formatting;

procedure Tasks is

  start_time : Time;

  task type tt1 is
    entry start;
  end tt1;

  task body tt1 is
    i : integer := 0;
  begin
    accept start;
    loop
      if i mod 10 /= 0 then
        put("Task 1: "); put(i); new_line;
      else
        i := 0;
      end if;
      i := i + 1;
      delay(1.0);
    end loop;
  end tt1;

  task type tt2 is
    entry start;
  end tt2;

  task body tt2 is
    ts : Time_Span;
    d : Duration;
  begin
    accept start;
    loop
      ts := Clock - start_time;
      d := To_Duration(ts);
      put("Task 2: "); put_line(Image(d, true));
      delay(10.0);
    end loop;
  end tt2;

  t1 : tt1;
  t2 : tt2;

begin
  start_time := Clock;

  t1.start;
  t2.start;
end Tasks;
