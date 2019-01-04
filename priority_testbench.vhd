-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench_priority IS
END ENTITY testbench_priority;

ARCHITECTURE test of testbench_priority IS
COMPONENT priority IS
    PORT( sel: IN bit_vector(0 TO 3);
        z: OUT bit_vector(0 TO 2));
END COMPONENT priority;
FOR ALL: priority USE ENTITY work.priority(behav);
SIGNAL sel : bit_vector(0 TO 3); 
SIGNAL z: bit_vector(0 TO 2); 
BEGIN  
	dut: ENTITY work.priority(behav) PORT MAP (sel=>sel,z=>z);
	p: PROCESS IS								 
	BEGIN
		sel <= "0000"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 1!" 
		SEVERITY error;
		sel <= "1000"; WAIT FOR 10 ns;
		ASSERT z <= "000"
		REPORT "ERROR 2!" 
		SEVERITY error;
		sel <= "0100"; WAIT FOR 10 ns;
		ASSERT z <= "001"
		REPORT "ERROR 3!" 
		SEVERITY error;
		sel <= "1100"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 4!" 
		SEVERITY error;
		sel <= "0010"; WAIT FOR 10 ns;
		ASSERT z <= "010"
		REPORT "ERROR 5!" 
		SEVERITY error;
		sel <= "1010"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 6!" 
		SEVERITY error;
		sel <= "0110"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 7!" 
		SEVERITY error;
		sel <= "1110"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 8!" 
		SEVERITY error;
		sel <= "0001"; WAIT FOR 10 ns;
		ASSERT z <= "011"
		REPORT "ERROR 9!" 
		SEVERITY error;
		sel <= "1001"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 10!" 
		SEVERITY error;
		sel <= "0101"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 11!" 
		SEVERITY error;
		sel <= "1101"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 12!" 
		SEVERITY error;
		sel <= "0011"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 13!" 
		SEVERITY error;
		sel <= "1011"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 14!" 
		SEVERITY error;
		sel <= "0111"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 15!" 
		SEVERITY error;
		sel <= "1111"; WAIT FOR 10 ns;
		ASSERT z <= "111"
		REPORT "ERROR 16!" 
		SEVERITY error;
		
		WAIT;
		
	END PROCESS p;

END ARCHITECTURE test;
