with Ada.Text_IO;
use Ada.Text_IO;

package body long_vektoren_ea is

   procedure Put (
      v : vektor;
      Fore : Field := Default_Fore;
      Aft : Field := Default_Aft;
      Exp : Field := Default_Exp      ) is
   begin
      put("( ");
      for i in v'range loop  
         put(v(i), fore => 5, aft => 2, exp => 0);
         if i < v'last then
            put(" ,");
         end if;
      end loop;
      put(" )");
   end put;

end long_vektoren_ea;



