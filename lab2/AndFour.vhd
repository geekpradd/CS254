library ieee; 
use ieee.std_logic_1164.all;

-- entity to compute AND of four signals. It uses AndGate as a Component.
entity AndFour is
	port ( x1,x2,x3,x4: std_logic;   -- The four inputs
	 R: out std_logic);  -- R = x1 AND x2 AND x3 AND x4
end entity;

architecture ARCH of AndFour is
	component AndGate is
		port (P, Q: in std_logic; R: out std_logic);
	end component;
	signal y1,y2: std_logic;  -- signals to store AND of 2 variables
begin 
	Chip1: AndGate
		port map(x1, x2, y1);  -- y1 = x1 AND x2
	Chip2: AndGate
		port map(x3, x4, y2);  -- y2 = x3 AND x4
	Chip3: AndGate
		port map(y1, y2, R);   -- R = y1 AND y2 = (x1 AND x2) AND (x3 AND x4) = x1 AND x2 AND x3 AND x4
end;