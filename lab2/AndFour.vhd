library ieee; 
use ieee.std_logic_1164.all;

entity AndFour is
	port ( x1,x2,x3,x4: std_logic;
	 R: out std_logic);
end entity;

architecture ARCH of AndFour is
	component AndGate is
		port (P, Q: in std_logic; R: out std_logic);
	end component;
	signal y1,y2: std_logic;
begin 
	Chip1: AndGate
		port map(x1, x2, y1);
	Chip2: AndGate
		port map(x3, x4, y2);
	Chip3: AndGate
		port map(y1, y2, R);
end;