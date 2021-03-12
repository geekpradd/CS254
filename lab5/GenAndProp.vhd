library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- Compute Generate and Propagate from ai and bi. Uses the Generator and Propogate entities.
entity GenAndProp is
	port ( a, b : in std_logic;
	g,p: out std_logic
	);
end entity;

architecture ARCHGaP of GenAndProp is
	component Propogate is
		port ( a, b : in std_logic;
		p: out std_logic
		);
	end component;
	
	component Generator is
		port ( a, b : in std_logic;
		g: out std_logic
		);
	end component;
begin
	chip1: Propogate
		port map(a,b,g);
	chip2: Propogate
		port map(a,b,p);
end;
