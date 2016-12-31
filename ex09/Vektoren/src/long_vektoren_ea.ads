with Ada.Text_IO;
     use Ada.Text_IO;

with long_vektoren;
     use long_vektoren;

with Long_Float_Text_IO;
     use Long_Float_Text_IO;

package long_vektoren_ea is

   procedure Put (
      v : vektor;
      Fore : Field := Default_Fore;
      Aft : Field := Default_Aft;
      Exp : Field := Default_Exp      );

end long_vektoren_ea;

