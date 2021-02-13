library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- entity to compute OR of four signals. It uses OrGate as a Component.
entity OrFour is
	port ( x1,x2,x3,x4: std_logic; -- The four inputs
	 R: out std_logic); -- R = x1 OR x2 OR x3 OR x4
end entity;

architecture ARCH of OrFour is
	component OrGate is
		port (X,Y : in std_logic;
		O : out std_logic);
	end component;
	signal y1,y2: std_logic; -- signals to store OR of 2 variables
begin 
	Chip1: OrGate
		port map(x1, x2, y1); -- y1 = x1 OR x2
	Chip2: OrGate
		port map(x3, x4, y2); -- y2 = x3 OR x4
	Chip3: OrGate
		port map(y1, y2, R); -- R = y1 OR y2 = (x1 OR x2) OR (x3 OR x4) = x1 OR x2 OR x3 OR x4
end;