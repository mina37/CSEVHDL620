-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench_mux IS
END ENTITY testbench_mux;

ARCHITECTURE test of testbench_mux IS
COMPONENT mux IS
    PORT( a,b,c,d: IN std_logic;
        s: IN std_logic_vector(1 DOWNTO 0);
        z: OUT std_logic);
END COMPONENT mux;
FOR ALL: mux USE ENTITY work.mux(mux);
SIGNAL s : std_logic_vector(1 DOWNTO 0); 
SIGNAL z: std_logic;
SIGNAL a: std_logic;
SIGNAL b: std_logic;
SIGNAL c: std_logic;
SIGNAL d: std_logic; 
BEGIN  
	dut: ENTITY work.mux(mux) PORT MAP (a=>a,b=>b,c=>c,d=>d,s=>s,z=>z);
	p: PROCESS IS								 
	BEGIN
		a <= '0';
		b <= '0';
		c <= '0';
		d <= '0';
		s <= "00"; WAIT FOR 10 ns;
		ASSERT z <= '0'
		REPORT "ERROR 1!" 
		SEVERITY error;
		a <= '1'; WAIT FOR 10 ns;
		ASSERT z <= '1'
		REPORT "ERROR 2!" 
		SEVERITY error;
		s <= "01"; WAIT FOR 10 ns;
		ASSERT z <= '0'
		REPORT "ERROR 3!" 
		SEVERITY error;
		b <= '1'; WAIT FOR 10 ns;
		ASSERT z <= '1'
		REPORT "ERROR 4!" 
		SEVERITY error;
		s <= "10"; WAIT FOR 10 ns;
		ASSERT z <= '0'
		REPORT "ERROR 5!" 
		SEVERITY error;
		c <= '1'; WAIT FOR 10 ns;
		ASSERT z <= '1'
		REPORT "ERROR 6!" 
		SEVERITY error;
		s <= "11"; WAIT FOR 10 ns;
		ASSERT z <= '0'
		REPORT "ERROR 7!" 
		SEVERITY error;
		d <= '1'; WAIT FOR 10 ns;
		ASSERT z <= '1'
		REPORT "ERROR 8!" 
		SEVERITY error;
		
		WAIT;
		
	END PROCESS p;

END ARCHITECTURE test;
