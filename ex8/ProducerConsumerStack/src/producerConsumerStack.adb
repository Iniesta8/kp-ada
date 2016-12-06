---------------------------------------------------------------------------
-- Programm    : \Uebung8\erz_verbr.adb
-- Verfasser   : T. Tempelmeier
-- Datum       : 17.10.07 15:47:49
-- Beschreibung: Erzeuger-Verbraucher-Problem mit Flu�kontrolle   STACK
--               Einfache Demo-Version
--               In der Praxis: + generisch + eigenes Paket + protected TYPE
-- �nderungen  :
---------------------------------------------------------------------------

with Ada.Text_IO;                use Ada.Text_IO;
with Ada.Float_Text_IO;          use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;

procedure producerConsumerStack is

  size  : constant positive := 10;
  type store_array is array (1 .. size) of float;

  function getRandom(gen : Generator) return Float is
  begin -- getRandom
    return random(gen) * 10.0;
  end getRandom;

  -----------------------------------------------------------

  protected stack is                   -- protected object
    entry push (item : in  float);
    entry pop  (item : out float);
    private
    index : natural := 0;
    store : store_array;
  end stack;

  protected body stack is
    entry push (item : in float) when index < size  is
    begin                      -- falls Stack nicht voll
      index := index + 1;
      store (index) := item;
    end push;
    entry pop (item : out float) when index > 0 is
    begin                      -- falls Stack nicht leer
      item  := store (index);
      index := index -1;
    end pop;
  end stack;

  -- Wechselseitiger Ausschluß ist automatisch sichergestellt
  -- Flußkontrolle ist durch die when-Klauseln sichergestellt

  -----------------------------------------------------------

  task producer;

  task body producer is
    x : float;
    gen : Generator;
  begin
    loop
      -- Empfange irgendwoher Daten oder erzeuge Daten
      x := getRandom(gen);  -- hier: zufälliger Wert

      delay duration(getRandom(gen)); -- zufällige Verzögerung der Task
        put ("Producer "); put (x, 5, 1, 0); new_line;

        -- Speichere Daten im Zwischenpuffer Stack
        stack.push (x);
    end loop;
  end producer;

  -----------------------------------------------------------

  task consumer;

  task body consumer is
    x : float;
    gen : Generator;
  begin
    loop
      delay duration(getRandom(gen)); -- zufällige Verzögerung der Task

        -- Hole Daten aus Zwischenpuffer Stack
        stack.pop (x);

        -- Verarbeite Daten bzw. verbrauche Daten
        put ("Consumer "); put (x, 5, 1, 0); new_line;
      end loop;
  end consumer;

  -----------------------------------------------------------

begin

  put_line ("Both tasks are running now!");

  skip_line;

end producerConsumerStack;
