library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- entity to calculate G[i:i] for the adder given ai,bi. G[i:i] = ai . bi
entity Generator is
	port ( a, b : in std_logic;
	g: out std_logic
	);
end entity;

architecture ARCHGen of Generator is
	component ANDMux is
		port( i1: in std_logic;
		i0: in std_logic;
		z: out std_logic);
	end component;
begin
	chip2: ANDMux
		port map(a,b,g);
end;
