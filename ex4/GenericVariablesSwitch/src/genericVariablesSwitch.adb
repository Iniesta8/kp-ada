with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Variable_Length255; use Variable_Length255;
with Variable_Length255.IO; use Variable_Length255.IO;

procedure genericVariablesSwitch is

  generic
    type genericType is private;

  procedure variablesSwitch(x, y : in out genericType);

  procedure variablesSwitch(x, y : in out genericType) is
    temp : genericType;
  begin
    temp := x;
    x := y;
    y := temp;
  end variablesSwitch;

  procedure floatSwitch is new
    variablesSwitch(genericType => float);

  procedure stringSwitch is new
    variablesSwitch(genericType => Variable_String);

  s1 : Variable_String := To_Variable_String("Hello");
  s2 : Variable_String := To_Variable_String("World");

  f1 : float := 1.0;
  f2 : float := 2.0;

begin

  put("Before float switch:"); new_line;
  put("f1 = "); put(f1); new_line;
  put("f2 = "); put(f2); new_line;

  put("Before string switch:"); new_line;
  put("s1 = "); put(s1); new_line;
  put("s2 = "); put(s2); new_line;

  -- switch floats
  floatSwitch(f1, f2);

  -- switch strings
  stringSwitch(s1, s2);

  put("After float switch:"); new_line;
  put("f1 = "); put(f1); new_line;
  put("f2 = "); put(f2); new_line;

  put("After string switch:"); new_line;
  put("s1 = "); put(s1); new_line;
  put("s2 = "); put(s2); new_line;

end genericVariablesSwitch;
