LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tFA IS
END tFA;
 
ARCHITECTURE behavior OF tFA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FA
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         cout : OUT  std_logic;
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal cout : std_logic;
   signal s : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FA PORT MAP (
          a => a,
          b => b,
          cin => cin,
          cout => cout,
          s => s
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		a <= '1';
		b <= '1';
		cin <= '1';

      wait for 10 ns;	
		a <= '1';
		b <= '1';
		cin <= '0';
		
      wait for 10 ns;	
		a <= '0';
		b <= '1';
		cin <= '0';
--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
