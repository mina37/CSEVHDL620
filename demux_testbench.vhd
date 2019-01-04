-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL; -- for the to_integer function

ENTITY testbench_demux IS
END ENTITY testbench_demux;

ARCHITECTURE test of testbench_demux IS
COMPONENT demux IS
    PORT ( a: IN unsigned (1 DOWNTO 0);
         d: IN std_logic;
         z: OUT unsigned (3 DOWNTO 0)); 
END COMPONENT demux;
FOR ALL: demux USE ENTITY work.demux(rtl);
SIGNAL a: unsigned ( 1 DOWNTO 0);
SIGNAL d: std_logic;
SIGNAL z: unsigned (3 DOWNTO 0);
BEGIN  
	dut: ENTITY work.demux(rtl) PORT MAP (a=>a,d=>d,z=>z);
	p: PROCESS IS								 
	BEGIN
		a <= "00";
		d <= '0'; WAIT FOR 10 ns;
		ASSERT z = "0000"
		REPORT "ERROR 1!" 
		SEVERITY error;
		d <= '1'; WAIT FOR 10 ns;
		ASSERT z = "0001"
		REPORT "ERROR 2!" 
		SEVERITY error;
		a <= "01"; WAIT FOR 10 ns;
		ASSERT z = "0010"
		REPORT "ERROR 3!" 
		SEVERITY error;
		d <= '0'; WAIT FOR 10 ns;
		ASSERT z = "0000"
		REPORT "ERROR 4!" 
		SEVERITY error;
		a <= "11"; WAIT FOR 10 ns;
		ASSERT z = "0000"
		REPORT "ERROR 5!" 
		SEVERITY error;
		d <= '1'; WAIT FOR 10 ns;
		ASSERT z = "1000"
		REPORT "ERROR 6!" 
		SEVERITY error;
		a <= "10"; WAIT FOR 10 ns;
		ASSERT z = "0100"
		REPORT "ERROR 7!" 
		SEVERITY error;
		d <= '0'; WAIT FOR 10 ns;
		ASSERT z = "0000"
		REPORT "ERROR 8!" 
		SEVERITY error;
		
		WAIT;
		
	END PROCESS p;

END ARCHITECTURE test;
