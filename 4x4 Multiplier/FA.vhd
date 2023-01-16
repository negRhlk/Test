library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FA is
    Port ( A : in  STD_LOGIC := '0';
           B : in  STD_LOGIC := '0';
           Cin : in  STD_LOGIC := '0';
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end FA;

architecture Behavioral of FA is
begin

	S <= A XOR (B XOR Cin) ;
	Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;

end Behavioral;

