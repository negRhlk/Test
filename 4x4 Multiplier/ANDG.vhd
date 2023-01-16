library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ANDG is
    Port ( A : in  STD_LOGIC := '0';
           B : in  STD_LOGIC := '0';
           O : out  STD_LOGIC);
end ANDG;

architecture Behavioral of ANDG is

begin

	O <= A and B;

end Behavioral;

