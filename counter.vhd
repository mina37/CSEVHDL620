-----------------------------------------------------------
-- A free-running counter that starts from 0 and 
-- increments mod 16 on each rising edge of the clock.
-----------------------------------------------------------

ENTITY counter IS
   PORT( clk: IN bit;
         count: OUT natural RANGE 0 TO 15); 
END ENTITY counter;

ARCHITECTURE behav OF counter IS
BEGIN 
   Pcount: PROCESS IS
     VARIABLE count_value: natural RANGE 0 TO 15 := 0;
   BEGIN
     count <= count_value;
     LOOP
       WAIT UNTIL clk = '1';
       count_value := (count_value + 1) MOD 16; 
       count <= count_value;
     END LOOP;
   END  PROCESS Pcount;
END ARCHITECTURE behav;