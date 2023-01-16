LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MP_BENCH IS
END MP_BENCH;
 
ARCHITECTURE behavior OF MP_BENCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MULTIPLIER
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');
   signal Y : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MULTIPLIER PORT MAP (
          X => X,
          Y => Y,
          P => P
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
		X <= "0101"; --5
		Y <= "0010"; --2
      wait for 100 ns;	

		X <= "1001"; --9
		Y <= "0111"; --7
      wait for 100 ns;
		
		X <= "1111"; --15
		Y <= "1110"; --14
      wait for 100 ns;

		X <= "1110"; --14
		Y <= "1101"; --13
      wait for 100 ns;
		
		X <= "0110"; --6
		Y <= "0100"; --4
      wait for 100 ns;

		X <= "0011"; --3
		Y <= "0110"; --6
      wait for 100 ns;	
		
		--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
