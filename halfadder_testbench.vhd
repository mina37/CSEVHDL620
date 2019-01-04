-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench_halfadder IS
END ENTITY testbench_halfadder;

ARCHITECTURE test of testbench_halfadder IS
COMPONENT half_adder IS
    PORT( a,b: IN bit;
        s,c: OUT bit); 
END COMPONENT half_adder;
FOR ALL: half_adder USE ENTITY work.half_adder(dataflow);
SIGNAL s : bit;
SIGNAL a: bit;
SIGNAL b: bit;
SIGNAL c: bit;
BEGIN  
	dut: ENTITY work.half_adder(dataflow) PORT MAP (a=>a,b=>b,c=>c,s=>s);
	p: PROCESS IS								 
	BEGIN
		a <= '0';
		b <= '0'; WAIT FOR 10 ns;
		ASSERT s = '0' and c ='0'
		REPORT "ERROR 1!" 
		SEVERITY error;
		a <= '1'; WAIT FOR 10 ns;
		ASSERT s = '1' and c = '0'
		REPORT "ERROR 2!" 
		SEVERITY error;
		b <= '1'; WAIT FOR 10 ns;
		ASSERT s = '0' and c ='1'
		REPORT "ERROR 3!" 
		SEVERITY error;
		a <= '0'; WAIT FOR 10 ns;
		ASSERT s = '1' and c ='0'
		REPORT "ERROR 4!" 
		SEVERITY error;
		
		WAIT;
		
	END PROCESS p;

END ARCHITECTURE test;
