-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL; -- for the to_integer function

ENTITY testbench_and IS
END ENTITY testbench_and;

ARCHITECTURE test of testbench_and IS
COMPONENT and4 IS
    PORT( x1, x2, x3, x4 : IN bit;
        y: OUT bit); 
END COMPONENT and4;
FOR ALL: and4 USE ENTITY work.and4(struct);
SIGNAL x1: bit;
SIGNAL x2: bit;
SIGNAL x3: bit;
SIGNAL x4: bit;
SIGNAL y: bit;


BEGIN  
	dut: ENTITY work.and4(struct) PORT MAP (x1=>x1,x2=>x2,x3=>x3,x4=>x4,y=>y);
	p: PROCESS IS								 
	BEGIN
		x1 <= '0';
		x2 <= '0';
		x3 <= '0';
		x4 <= '0'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 1!" 
		SEVERITY error;
		x1 <= '1'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 2!" 
		SEVERITY error;
		x2 <= '1'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 3!" 
		SEVERITY error;
		x1 <= '0'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 4!" 
		SEVERITY error;
		x3 <= '1'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 5!"
		SEVERITY error;	
		x1 <= '1'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 6!" 	
		SEVERITY error;
		x2 <= '0'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 7!" 	
		SEVERITY error;
		x1 <= '0'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 8!" 	
		SEVERITY error;
		x4 <= '1'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 9!" 	
		SEVERITY error;
		x1 <= '1'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 10!" 	
		SEVERITY error;
		x2 <= '1'; WAIT FOR 10 ns;
		ASSERT y = '1'
		REPORT "ERROR 11!" 	
		SEVERITY error;
		x1 <= '0'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 12!" 	
		SEVERITY error;
		x3 <= '0'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 13!" 	
		SEVERITY error;
		x1 <= '1'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 14!" 	
		SEVERITY error;
		x2 <= '0'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 15!" 	
		SEVERITY error;
		x1 <= '0'; WAIT FOR 10 ns;
		ASSERT y = '0'
		REPORT "ERROR 16!" 	
		SEVERITY error;
		
		WAIT;
	END PROCESS p;

END ARCHITECTURE test;
