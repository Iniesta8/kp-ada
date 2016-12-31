with Ada.Text_IO;                use Ada.Text_IO;
with Ada.Float_Text_IO;          use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;

procedure producerConsumerFIFO is

  size  : constant positive := 10;
  type store_array is array (1 .. size) of float;

  function getRandom(gen : Generator) return Float is
  begin -- getRandom
    return random(gen) * 3.0;
  end getRandom;

  -----------------------------------------------------------

  protected fifo is                   -- protected object
    entry put (item : in  float);
    entry get  (item : out float);
    private
    fill_level : natural := 0;    -- aktueller Füllstand
    read_pos : natural := 1;      -- Leseposition
    write_pos : natural := 1;     -- Schreibposition
    store : store_array;
  end fifo;

  protected body fifo is
    entry put (item : in float) when fill_level < size  is
    begin                      -- falls FIFO nicht voll
      store (write_pos) := item;
      fill_level := fill_level + 1;
      if write_pos = size then
        write_pos := 1;
      else
        write_pos := write_pos + 1;
      end if;
    end put;

    entry get (item : out float) when fill_level > 0 is
    begin                      -- falls FIFO nicht leer
      item  := store (read_pos);
      fill_level := fill_level - 1;
      if read_pos = size then
        read_pos := 1;
      else
        read_pos := read_pos + 1;
      end if;
    end get;
  end fifo;

  -- Wechselseitiger Ausschluß ist automatisch sichergestellt
  -- Flußkontrolle ist durch die when-Klauseln sichergestellt

  -----------------------------------------------------------

  task producer;

  task body producer is
    x, d : float;
    gen : Generator;
  begin
    reset(gen, 1);
    loop
      -- Empfange irgendwoher Daten oder erzeuge Daten
      x := getRandom(gen);  -- hier: zufälliger Wert
      d := getRandom(gen);

      delay duration(d); -- zufällige Verzögerung der Task
        put_line ("Producer puts" & Float'Image(x) & ", delayed" & Float'Image(d));
        -- Speichere Daten im Zwischenpuffer Stack
        fifo.put (x);
    end loop;
  end producer;

  -----------------------------------------------------------

  task consumer;

  task body consumer is
    x, d : float;
    gen : Generator;
  begin
    reset(gen, 2);
    loop
      d := getRandom(gen);
      delay duration(d); -- zufällige Verzögerung der Task

        -- Hole Daten aus Zwischenpuffer Stack
        fifo.get (x);

        -- Verarbeite Daten bzw. verbrauche Daten
        put_line ("Consumer gets" & Float'Image(x) & ", delayed" & Float'Image(d));
      end loop;
  end consumer;

  -----------------------------------------------------------

begin

  put_line ("Both tasks are running now!");

  skip_line;

end producerConsumerFIFO;
