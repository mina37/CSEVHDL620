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
SIGNAL t : std_logic :='0'; 
SIGNAL clk: std_logic :='0'; 
SIGNAL clear: std_logic :='0';
SIGNAL q: std_logic :='0';
BEGIN  
	dut: ENTITY work.t_ff(async_clear) PORT MAP (t=>t,clk=>clk,clear =>clear,q=>q);
	p: PROCESS IS								 
	BEGIN
		t <= '0';
		clk <= '0';
		clear <= '0'; WAIT FOR 10 ns;
		clear <= '1'; WAIT FOR 10 ns;
		ASSERT q = '0'
		REPORT "ERROR 1!" 
		SEVERITY error;
		t <= '1'; WAIT FOR 10 ns;
		ASSERT q = '0'
		REPORT "ERROR 2!"
		SEVERITY error;
        clear <= '0'; WAIT FOR 10 ns;
        ASSERT q = '0'
		REPORT "ERROR 3!"
		SEVERITY error;
		clk <= '1'; WAIT FOR 10 ns;
        ASSERT q = '1'
		REPORT "ERROR 4!"
		SEVERITY error;
		clear <= '1'; WAIT FOR 10 ns;
        ASSERT q = '0'
		REPORT "ERROR 5!"
		SEVERITY error;
		t <= '0'; WAIT FOR 10 ns;
        ASSERT q = '0'
		REPORT "ERROR 6!"
		SEVERITY error;
		clear <= '0'; WAIT FOR 10 ns;
        ASSERT q = '0'
		REPORT "ERROR 7!"
		SEVERITY error;
		clk <= '0'; WAIT FOR 10 ns;
        ASSERT q = '0'
		REPORT "ERROR 8!"
		SEVERITY error;
		t <= '1'; WAIT FOR 10 ns;
        ASSERT q = '0'
		REPORT "ERROR 9!"
		SEVERITY error;
		clk <= '1'; WAIT FOR 10 ns;
        ASSERT q = '1'
		REPORT "ERROR 10!"
		SEVERITY error;
		clk <= '0'; WAIT FOR 10 ns;
        ASSERT q = '1'
		REPORT "ERROR 11!"
		SEVERITY error;
		clk <= '1'; WAIT FOR 10 ns;
        ASSERT q = '0'
		REPORT "ERROR 12!"
		SEVERITY error;
	
		WAIT;
		
	END PROCESS p;

END ARCHITECTURE test;
