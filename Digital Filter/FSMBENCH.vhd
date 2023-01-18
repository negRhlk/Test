LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY FSMBENCH IS
END FSMBENCH;
 
ARCHITECTURE behavior OF FSMBENCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         vin : IN  REAL;
         vout : OUT  REAL;
         clk : IN  BIT
        );
    END COMPONENT;
    

   --Inputs
   signal vin : REAL := 0.0;
   signal clk : BIT := '0';

 	--Outputs
   signal vout : REAL;

   -- Clock period definitions
   constant clk_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          vin => vin,
          vout => vout,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--      wait for 100 ns;	
		vin <= 1.0;
      wait for clk_period*5;
		vin <= 0.0;
      wait for clk_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
