-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench_latch IS
END ENTITY testbench_latch;

ARCHITECTURE test of testbench_latch IS
COMPONENT latch IS
    PORT( d: IN bit;
		  clk: IN bit;
        q: OUT bit;
		nq: OUT bit);
END COMPONENT latch;
FOR ALL: latch USE ENTITY work.latch(behav);
SIGNAL ip : bit :='0'; 
SIGNAL clock: bit :='0'; 
SIGNAL op: bit :='0';
SIGNAL nop : bit :='0';
BEGIN
	---dut: latch PORT MAP (d=>ip,clk=>clock,q=>op,nq=>nop);  
	dut: ENTITY work.latch(behav) PORT MAP (d=>ip,clk=>clock,q=>op,nq=>nop);
	p: PROCESS IS								 
	BEGIN
		ip <= '1';
		clock <= '0'; WAIT FOR 10 ns;
		clock <= '1'; WAIT FOR 10 ns;
		ASSERT op = '1'
		REPORT "ERROR 1!" 
		SEVERITY error;
		ASSERT nop = '0'
		REPORT "ERROR 2!"
		SEVERITY error;
		ip <= '0'; WAIT FOR 10 ns;
		ASSERT op = '0'
		REPORT "ERROR 3!"
		SEVERITY error;	 
		ASSERT nop = '1'
		REPORT "ERROR 4!"
		SEVERITY error;
        WAIT;
		
	END PROCESS p;

END ARCHITECTURE test;
