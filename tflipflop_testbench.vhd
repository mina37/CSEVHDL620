-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench_t_ff IS
END ENTITY testbench_t_ff;

ARCHITECTURE test of testbench_t_ff IS
COMPONENT t_ff IS
    PORT(	t: IN std_logic;
			clk, clear: IN std_logic;
			q: OUT std_logic);
END COMPONENT t_ff;
FOR ALL: t_ff USE ENTITY work.t_ff(async_clear);
SIGNAL t : bit :='0'; 
SIGNAL clk: bit :='0'; 
SIGNAL clear: bit :='0';
SIGNAL q: bit :='0';
BEGIN  
	dut: ENTITY work.t_ff(async_clear) PORT MAP (t=>t,clk=>clk,clear =>clear,q=>q);
	p: PROCESS IS								 
	BEGIN
		ip <= '1';
		clock <= '0'; WAIT FOR 10 ns;
		clock <= '1'; WAIT FOR 10 ns;
		ASSERT op = '1' and nop = '0'
		REPORT "ERROR 1!" 
		SEVERITY error;
		ip <= '0'; WAIT FOR 10 ns;
		ASSERT op = '0' and nop = '1'
		REPORT "ERROR 2!"
		SEVERITY error;
        clock <= '0'; WAIT FOR 10 ns;
        ASSERT op = '0' and nop = '1'
		REPORT "ERROR 3!"
		SEVERITY error;
		ip <= '1'; WAIT FOR 10 ns;
        ASSERT op = '0' and nop = '1'
		REPORT "ERROR 4!"
		SEVERITY error;
	
		WAIT;
		
	END PROCESS p;

END ARCHITECTURE test;
