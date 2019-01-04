-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL; -- for the to_integer function

ENTITY testbench_decoder IS
END ENTITY testbench_decoder;

ARCHITECTURE test of testbench_decoder IS
COMPONENT decoder IS
    PORT( address: IN std_logic_vector(2 DOWNTO 0);
        decode: OUT std_logic_vector(7 DOWNTO 0)); 
END COMPONENT decoder;
FOR ALL: decoder USE ENTITY work.decoder(behav);
SIGNAL address: std_logic_vector ( 2 DOWNTO 0);
SIGNAL decode: std_logic_vector (7 DOWNTO 0);
BEGIN  
	dut: ENTITY work.decoder(behav) PORT MAP (address=>address,decode=>decode);
	p: PROCESS IS								 
	BEGIN
		address <= "000"; WAIT FOR 10 ns;
		ASSERT decode = X"00"
		REPORT "ERROR 1!" 
		SEVERITY error;
		address <= "001"; WAIT FOR 10 ns;
		ASSERT decode = X"11"
		REPORT "ERROR 2!" 
		SEVERITY error;
		address <= "011"; WAIT FOR 10 ns;
		ASSERT decode = X"00"
		REPORT "ERROR 3!" 
		SEVERITY error;
		address <= "010"; WAIT FOR 10 ns;
		ASSERT decode = X"44"
		REPORT "ERROR 4!" 
		SEVERITY error;
		address <= "110"; WAIT FOR 10 ns;
		ASSERT decode = X"88"
		REPORT "ERROR 5!" 
		SEVERITY error;
		address <= "111"; WAIT FOR 10 ns;
		ASSERT decode = X"42"
		REPORT "ERROR 6!" 
		SEVERITY error;
		address <= "101"; WAIT FOR 10 ns;
		ASSERT decode = X"88"
		REPORT "ERROR 7!" 
		SEVERITY error;
		address <= "100"; WAIT FOR 10 ns;
		ASSERT decode = X"00"
		REPORT "ERROR 8!" 
		SEVERITY error;
		
		WAIT;
		
	END PROCESS p;

END ARCHITECTURE test;
