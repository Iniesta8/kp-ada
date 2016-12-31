with Ada.Text_IO;
  use Ada.Text_IO;
with Ada.Integer_Text_IO;
  use Ada.Integer_Text_IO;
with Ada.Real_Time;
  use Ada.Real_Time;
with Ada.Calendar.Formatting;
  use Ada.Calendar.Formatting;

procedure Tasks_until is

  start_time : Time;

  task type tt1 is
    entry start;
  end tt1;

  task body tt1 is
    cycle : constant Time_Span := milliseconds(1_000);
    next_time : time := Clock + cycle;
  begin
    accept start;
    loop
      for i in 1..10 loop
        delay until next_time;
        if i mod 10 /= 0 then
          put("Task 1: "); put(i); new_line;
        end if;
        next_time := next_time + cycle;
      end loop;
    end loop;
  end tt1;

  task type tt2 is
    entry start;
  end tt2;

  task body tt2 is
    cycle : constant Time_Span := milliseconds(10_000);
    next_time : time := Clock + cycle;
    ts : Time_Span;
    d : Duration;
  begin
    accept start;
    loop
      delay until next_time;
      ts := Clock - start_time;
      d := To_Duration(ts);
      put("Task 2: "); put_line(Image(d, true));
      next_time := next_time + cycle;
    end loop;
  end tt2;

  t1 : tt1;
  t2 : tt2;

begin
  start_time := Clock;

  t1.start;
  t2.start;
end Tasks_until;
