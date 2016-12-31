--------------------------------------------------------------------------------
--  *  Soec name Jarvis_March.ads
--  *
--  *  Created by Adrian Hoe on 31/12/2016.
--  *  http://adrianhoe.com
--  *
--------------------------------------------------------------------------------

pragma Assertion_Policy(Check);

package Jarvis_March is

   type Orientation is ( Colinear, Clockwise, Counter_Clockwise );
      
   type Point is
      record
         X : Integer;
         Y : Integer;
      end record;
   
   type Points is array ( Integer range <> ) of Point;
   type Result is array ( Integer range <> ) of Integer;
   
   procedure Jarvis ( Ps : in     Points;
                      R  :    out Result )
      with Pre => ( Ps'Length > 2 );
      
private
 
   function Find_Orientation ( P, Q, R : Point )
      return Orientation;
      
   function Find_Leftmost ( Ps : Points )
      return Integer;
      
end Jarvis_March;