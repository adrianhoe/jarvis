--------------------------------------------------------------------------------
--  *  Body name Jarvis_March.adb
--  *
--  *  Created by Adrian Hoe on 31/12/2016.
--  *  http://adrianhoe.com
--  *
--------------------------------------------------------------------------------

package body Jarvis_March is
   
   procedure Jarvis ( Ps : in     Points;
                      R  :    out Result )
   is
      
      Size     : Natural := Ps'Length;
      
   begin
      declare
         Left, P, Q  : Integer;
      begin
            
         R := ( others => -1 );
            
         Left := Find_Leftmost ( Ps );
            
         P := Left;
            
         Search_Loop:
            loop
                  
               Q := ( ( P + 1 ) mod Size ) + 1;
                  
               for I in Ps'First .. Ps'Last loop
                                       
                  if ( Find_Orientation ( Ps ( P ), Ps ( I ), Ps ( Q ) ) = Counter_Clockwise ) then
                     Q := I;
                  end if;
                        
               end loop;
                     
               R ( P ) := Q;
               P := Q;
                  
               exit Search_Loop when P = Left;
                     
            end loop Search_Loop;
                        
      end;            
   end Jarvis;
   
   function Find_Leftmost ( Ps : Points ) return Integer is
   
      L    : Integer := Ps'First;
      P, Q : Point;
      
   begin
      
      for I in 1 .. Ps'Length loop
         
         P := Ps ( I );
         Q := Ps ( L );
         
         if ( P.X < Q.X ) then
            L := I;
         end if;
      end loop;
         
      return L;
   
   end Find_leftmost;
   
   function Find_Orientation ( P, Q, R : Point ) return Orientation is
   
      Direction : Integer;
      
   begin
      
      Direction := ( Q.Y - P.Y ) * ( R.X - Q.X ) - ( Q.X - P.X ) * ( R.Y - Q.Y );
      
      if Direction = 0 then
         return Colinear;
      end if;
         
      if Direction > 0 then
         return Clockwise;
      else
         return Counter_Clockwise;
      end if;
         
   end Find_Orientation;
   
end Jarvis_March;
