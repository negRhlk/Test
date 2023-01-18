library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
port (
	vin : in REAL;
	vout : out REAL;
	clk : in BIT
);
end FSM;

architecture Behavioral of FSM is
	TYPE STAT IS (s0, s1, s2, s3, s4, s5, s6, s7);
	SIGNAL state : STAT;
	SIGNAL r1, r2, r3, r4, r5, r6 : REAL := 0.0;
	SIGNAL cp, cz : REAL := 0.0;
begin
	PROCESS(clk)
		variable a1 : REAL := 1.7187;
		variable a2 : REAL := 0.7536;
		variable b1 : REAL := 2.0;
	BEGIN
		IF clk = '1' THEN CASE state IS
			WHEN s0 =>
				r1 <= a2;
				r2 <= a1;
				r3 <= vin;
				r4 <= b1;
				r5 <= cz;
				r6 <= cp;
				state <= s1;
			WHEN s1 =>
				r1 <= r1 * r5;
				state <= s2;
			WHEN s2 =>
				r2 <= r2 * r6;
				state <= s3;
			WHEN s3 =>
				r1 <= r1 + r2;
				r2 <= r4 * r6;
				state <= s4;
			WHEN s4 =>
				r1 <= r3 + r1;
				state <= s5;
			WHEN s5 =>
				r2 <= r5 + r2;
				state <= s6;
			WHEN s6 =>
				r2 <= r1 + r2;
				state <= s7;
			WHEN s7 =>
				cp <= r1;
				cz <= r6;
				state <= s0;
		END CASE;
		END IF;
	END PROCESS;
	
	PROCESS(state)
	BEGIN
		CASE state Is 
			WHEN s7 =>
				vout <= r2;
			WHEN OTHERs => null;
		END CASE;
	END PROCESS;
end Behavioral;

