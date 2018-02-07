//code from http://rosettacode.org/wiki/Combinations
with Ada.Text_IO;  use Ada.Text_IO;
 
procedure Test_Combinations is
   generic 
      type Integers is range <>; //Integers I believe implies that it will be more than one, making it a list
   package Combinations is //basically an interface for Combinations which is implemented below.
      type Combination is array (Positive range <>) of Integers;
      procedure First (X : in out Combination); // in out means X can be modified and read
      procedure Next (X : in out Combination); 
      procedure Put (X : Combination); //put only allows reading since in is default when not listed
   end Combinations;
 
   package body Combinations is
      procedure First (X : in out Combination) is
      begin
         X (1) := Integers'First; // 
         for I in 2..X'Last loop
            X (I) := X (I - 1) + 1;
         end loop;
      end First;
      procedure Next (X : in out Combination) is
      begin
         for I in reverse X'Range loop //start loop
            if X (I) < Integers'Val (Integers'Pos (Integers'Last) - X'Last + I) then
               X (I) := X (I) + 1;
               for J in I + 1..X'Last loop
                  X (J) := X (J - 1) + 1;
               end loop; //end loop
               return;
            end if;
         end loop;
         raise Constraint_Error;
      end Next;
      procedure Put (X : Combination) is
      begin
         for I in X'Range loop
            Put (Integers'Image (X (I)));
         end loop;
      end Put;
   end Combinations;
 
   type Five is range 0..4;
   package Fives is new Combinations (Five);
   use Fives;
 
   X : Combination (1..3);
begin  //start the 
   First (X);
   loop
      Put (X); New_Line;
      Next (X);
   end loop;
exception
   when Constraint_Error =>
      null;
end Test_Combinations;
