library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;


entity Four_Bit_Adder is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end Four_Bit_Adder;

architecture Structural of Four_Bit_Adder is

component FA
	port( a : in STD_LOGIC;
			b : in STD_LOGIC;
			cin : in STD_LOGIC;
			cout : out STD_LOGIC;
			s : out STD_LOGIC
			);
end component;

signal c1,c2,c3: STD_LOGIC;

begin

FA1 : FA port map(a(0), b(0), cin, c1, sum(0));
FA2 : FA port map(a(1), b(1), c1, c2, sum(1));
FA3 : FA port map(a(2), b(2), c2, c3, sum(2));
FA4 : FA port map(a(3), b(3), c3, cout, sum(3));

end Structural;

