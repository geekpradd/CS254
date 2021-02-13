library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- Main Enitity for the encoder 
entity EightbyThreeEncode is
	port ( i : in std_logic_vector(7 downto 0);
	en: in std_logic;
	z : out std_logic_vector(2 downto 0));
end entity;

architecture ARCH of EightbyThreeEncode is
	component OrFour is   -- takes four inputs and returns their OR. So, R = x1 OR x2 OR x3 OR x4
		port (x1,x2,x3,x4 : in std_logic;
		R : out std_logic);
	end component;
	
	component AndGate is  -- takes two inputs and returns their AND. So, R = P AND Q
		port (P,Q: in std_logic;
		R: out std_logic);
	end component;
	signal ored0, ored1, ored2: std_logic;  -- signals to store OR of inputs.
begin
 
	-- We first calculate the value of each output ignoring the value of en. These are stored in ored0, ored1, ored2. Then AND is taken with en to apply the enable criteria.
	-- Chip c calculates the possible value of z(c) if en = 1.
	-- z(c) will be one if c is set(i.e. =1) in the binary representation of the set bit of i.
	Chip1: OrFour
		port map(i(1), i(3), i(5), i(7), ored0); -- z(0) = i(1) OR i(3) OR i(5) OR i(7) as 0th bit is set in binary representation of 1,3,5,7 only 
	Chip2: OrFour
		port map(i(2), i(3), i(6), i(7), ored1); -- z(1) = i(2) OR i(3) OR i(6) OR i(7) as 1st bit is set in binary representation of 2,3,6,7 only
	Chip3: OrFour
		port map(i(4), i(5), i(6), i(7), ored2); -- z(2) = i(4) OR i(5) OR i(6) OR i(7) as 2nd bit is set in binary representation of 4,5,6,7 only
		
	-- Enable c instance applies the enable criteria(i.e. z(c) = ored_c only if en = 1). AND gate is used for this purpose.
	Enable1: AndGate
		port map(ored0,en,z(0));
	Enable2: AndGate
		port map(ored1,en,z(1));
	Enable3: AndGate
		port map(ored2,en,z(2));
		
	-- The above equations can be verified using the truth table
end;