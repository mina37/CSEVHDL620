--------------------------------------------------------------
-- A positive edge-triggered T-FF with an asynchronous clear.
---------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY t_ff IS 
	PORT(	t: IN std_logic;
			clk, clear: IN std_logic;
			q: OUT std_logic);
END ENTITY t_ff;

ARCHITECTURE async_clear OF t_ff IS
	SIGNAL internal_t: std_logic;
BEGIN
	TFF: PROCESS (clk, clear) IS BEGIN
		IF clear = '1' THEN
			internal_t <= '0';
		ELSIF rising_edge (clk) THEN 
			IF t = '1' THEN
				internal_t <= NOT internal_t;
			ELSIF t = '0' THEN
				internal_t <= internal_t;
			END IF;
		END IF;
	END PROCESS TFF;
	q <= internal_t;
END ARCHITECTURE async_clear;