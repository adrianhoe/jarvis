--------------------------------------------------------------------------------
--  *  Main program jarvistest.adb
--  *
--  *  Created by Adrian Hoe on 31/12/2016.
--  *  http://adrianhoe.com
--  *
--------------------------------------------------------------------------------

with Ada.Exceptions;    use Ada.Exceptions;
with Ada.Text_IO;       use Ada.Text_IO;
with Jarvis_March;      use Jarvis_March;

procedure jarvistest is
   
   Ps : Points ( 1 .. 7 ) := ( ( 0, 6 ), ( 1, 2 ), ( 1, 1 ), ( 2, 1 ), ( 3, 1 ), ( 0, 0 ), ( 4, 3) );
--   Ps : Points ( 1 .. 2 ) := ( ( 0, 6 ), ( 1, 2 ) );
   R  : Result ( Ps'Range );
   
   P : Point;
   
begin

   Jarvis ( Ps, R );
   
   for I in R'Range loop
      if ( R ( I ) /= -1 ) then
         P := Ps ( I );
         Put_Line ( "(" & Integer'Image ( P.X ) & ", " & Integer'Image ( P.Y ) & ")" );
      end if;
   end loop;

exception

   when Error : others => Put_Line (Ada.Exceptions.Exception_Name ( Error ) & ": Must have at least 3 points in the array.");
      
end jarvistest;