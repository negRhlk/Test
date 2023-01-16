library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HA is
    Port ( A : in  STD_LOGIC := '0';
           B : in  STD_LOGIC := '0';
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end HA;

architecture Behavioral of HA is

begin

	S <= A xor B;
	Cout <= A and B;

end Behavioral;

