-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL; -- for the to_integer function

ENTITY testbench_counter IS
END ENTITY testbench_counter;

ARCHITECTURE test of testbench_counter IS
COMPONENT counter IS
    PORT( clk: IN bit;
         count: OUT natural RANGE 0 TO 15);
END COMPONENT counter;
FOR ALL: counter USE ENTITY work.counter(behav);
SIGNAL clk: bit := '0';
SIGNAL i: natural RANGE 0 TO 16 := 0;
SIGNAL temp: natural RANGE 0 TO 16 := 0;
SIGNAL count: natural RANGE 0 TO 15;
BEGIN  
	dut: ENTITY work.counter(behav) PORT MAP (clk=>clk,count=>count);
	c: PROCESS IS
	BEGIN
		IF i = 15
		THEN
		WAIT;
		END IF;
		clk <= not(clk);
		WAIT FOR 10 ns;
	END PROCESS c;
	p: PROCESS IS								 
	BEGIN
		i <= i + 1;	
		temp <= i;
		WAIT UNTIL clk = '1';
		ASSERT count = temp
		REPORT "ERROR! count = " &integer'image(count)
		SEVERITY error;
		
	END PROCESS p;

END ARCHITECTURE test;
