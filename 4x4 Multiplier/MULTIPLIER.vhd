library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;

entity MULTIPLIER is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0));
end MULTIPLIER;

architecture STRUCTURAL of MULTIPLIER is

---------------------------full adder-----------------------------
component FA 
    Port ( A : in  STD_LOGIC := '0';
           B : in  STD_LOGIC := '0';
           Cin : in  STD_LOGIC := '0';
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

---------------------------half adder-----------------------------
component HA 
    Port ( A : in  STD_LOGIC := '0';
           B : in  STD_LOGIC := '0';
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

-------------------------------and--------------------------------
component ANDG
    Port ( A : in  STD_LOGIC := '0';
           B : in  STD_LOGIC := '0';
           O : out  STD_LOGIC);
end component;

signal AND1 : STD_LOGIC_VECTOR (3 downto 0);
signal AND2 : STD_LOGIC_VECTOR (3 downto 0);
signal AND3 : STD_LOGIC_VECTOR (3 downto 0);
signal AND4 : STD_LOGIC_VECTOR (3 downto 0);


signal C1, S1 : STD_LOGIC_VECTOR (3 downto 0);

signal C2, S2 : STD_LOGIC_VECTOR (3 downto 0);

signal C3, S3 : STD_LOGIC_VECTOR (3 downto 0);



begin

--------------------------------R1--------------------------------
A1_GEN: for i in 0 to 3 generate
	R1_AND : ANDG port map (B => X(i), A => Y(0), O => AND1(i));
end generate A1_GEN;

P(0) <= AND1(0);

--------------------------------R2--------------------------------
A2_GEN: for i in 0 to 3 generate
	R2_AND : ANDG port map (B => X(i), A => Y(1), O => AND2(i));
end generate A2_GEN;

F2_GEN: for i in 0 to 3 generate
   -----------------------------------
	F21: if i = 0 generate
		R2_HA1 : HA port map (A => AND1(1), B => AND2(i),
									 S => S1(i), Cout => C1(i));
	end generate F21;
	----------------------------------
	F22: if i = 3 generate
		R2_HA4 : HA port map (A => C1(i - 1), B => AND2(i),
									 S => S1(i), Cout => C1(i));
	end generate F22;
	---------------------------------
	F23: if (i = 1 or i = 2) generate
		R2_FA : FA port map (Cin => C1(i - 1), Cout => C1(i), S => S1(i),
									A => AND1(i + 1), B => AND2(i));
	end generate F23;
end generate F2_GEN;
	
P(1) <= S1(0);

--------------------------------R3--------------------------------
A3_GEN: for i in 0 to 3 generate
	R3_AND : ANDG port map (B => X(i), A => Y(2), O => AND3(i));
end generate A3_GEN;	

F3_GEN: for i in 0 to 3 generate
-------------------------------------
	F31: if i = 0 generate
		R3_HA1 : HA port map (A => S1(1), B => AND3(i),
									 S => S2(i), Cout => C2(i));
	end generate F31;
-------------------------------------------
	F32: if i = 3 generate
		R3_FA3 : FA port map (Cin => C2(i - 1), Cout => C2(i),
									 S => S2(i), A => C1(i), B => AND3(i));
	end generate F32;
---------------------------------------------
	F33: if (i = 1 or i = 2) generate
		R3_FA : FA port map (Cin => C2(i - 1), Cout => C2(i),
									S => S2(i), A => S1(i + 1), B => AND3(i));
	end generate F33;
end generate F3_GEN;

P(2) <= S2(0);

--------------------------------R4--------------------------------
A4_GEN: for i in 0 to 3 generate
	R4_AND : ANDG port map (B => X(i), A => Y(3), O => AND4(i));
end generate A4_GEN;	

F4_GEN: for i in 0 to 3 generate
--------------------------------------------
	F41: if i = 0 generate
		R4_HA1 : HA port map (A => S2(1), B => AND4(i), 
									 S => S3(i), Cout => C3(i));
	end generate F41;
----------------------------------------------
	F42: if i = 3 generate
		R4_FA3 : FA port map (Cin => C3(i - 1), Cout => C3(i),
									 S => S3(i), A => C2(i), B => AND4(i));
	end generate F42;
-----------------------------------------------	
	F43: if (i = 1 or i = 2) generate
		R3_FA : FA port map (Cin => C3(i - 1), Cout => C3(i),
									S => S3(i), A => S2(i + 1), B => AND4(i));
	end generate F43;
end generate F4_GEN;

P_GEN: for i in 3 to 6 generate
	P(i) <= S3(i - 3);
end generate P_GEN;

P(7) <= C3(3);

--P(3) <= S3(0);
--P(4) <= S3(1);
--P(5) <= S3(2);
--P(6) <= S3(3);


end STRUCTURAL;

