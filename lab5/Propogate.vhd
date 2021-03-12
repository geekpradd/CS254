library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- enitity to calculate P[i:i] given ai,bi. We have P[i:i] = ai XOR bi
entity Propogate is
	port ( a, b : in std_logic;
	p: out std_logic
	);
end entity;

architecture ARCHProp of Propogate is
	component XORMux is
		port( i1: in std_logic;
		i0: in std_logic;
		z: out std_logic
		);
	end component;
begin
	chip2: XORMux
		port map(a,b,p);
end;
