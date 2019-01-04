---------------------------
-- Synthesis of a DEMUX.
---------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; -- for the to_integer function

ENTITY demux IS
  PORT ( a: IN unsigned (1 DOWNTO 0);
         d: IN std_logic;
         z: OUT unsigned (3 DOWNTO 0)); 
END ENTITY demux;

ARCHITECTURE rtl OF demux IS
BEGIN 
  dm: PROCESS (a, d) IS
    VARIABLE temp: integer RANGE 0 TO 3;
  BEGIN
    temp := to_integer(a); -- converts an unsigned into an integer
    FOR j IN z'RANGE LOOP
      IF temp = j THEN
        z(j) <= d;
      ELSE
        z(j) <= '0';
      END IF;
    END LOOP;
  END PROCESS dm;
END ARCHITECTURE rtl;