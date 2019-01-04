-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench_fulladder IS
END ENTITY testbench_fulladder;

ARCHITECTURE test of testbench_fulladder IS
COMPONENT full_adder IS
    PORT( a, b, c_in : IN bit;
         s, c_out : OUT bit);
END COMPONENT full_adder;
FOR ALL: full_adder USE ENTITY work.full_adder(fa);
SIGNAL s : bit;
SIGNAL a: bit;
SIGNAL b: bit;
SIGNAL c_in: bit;
SIGNAL c_out: bit;
BEGIN  
	dut: ENTITY work.full_adder(fa) PORT MAP (a=>a,b=>b,c_in=>c_in,s=>s,c_out=>c_out);
	p: PROCESS IS								 
	BEGIN
		a <= '0';
		c_in <= '0';
		b <= '0'; WAIT FOR 10 ns;
		ASSERT s = '0' and c_out ='0'
		REPORT "ERROR 1!" 
		SEVERITY error;
		a <= '1'; WAIT FOR 10 ns;
		ASSERT s = '1' and c_out = '0'
		REPORT "ERROR 2!" 
		SEVERITY error;
		b <= '1'; WAIT FOR 10 ns;
		ASSERT s = '0' and c_out ='1'
		REPORT "ERROR 3!" 
		SEVERITY error;
		a <= '0'; WAIT FOR 10 ns;
		ASSERT s = '1' and c_out ='0'
		REPORT "ERROR 4!" 
		SEVERITY error;
		c_in <= '1'; WAIT FOR 10 ns;
		ASSERT s = '0' and c_out ='1'
		REPORT "ERROR 5!" 
		SEVERITY error;
		a <= '1'; WAIT FOR 10 ns;
		ASSERT s = '1' and c_out ='1'
		REPORT "ERROR 6!" 
		SEVERITY error;
		b <= '0'; WAIT FOR 10 ns;
		ASSERT s = '0' and c_out ='1'
		REPORT "ERROR 7!" 
		SEVERITY error;
		a <= '0'; WAIT FOR 10 ns;
		ASSERT s = '1' and c_out ='0'
		REPORT "ERROR 8!" 
		SEVERITY error;
		
		WAIT;
		
	END PROCESS p;

END ARCHITECTURE test;
