library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- Perform Carry computation for one bit.
entity CarryHelper is
	port(g,p,cin : in std_logic;
	c: out std_logic);
end entity;

architecture ARCHCarryHelp of CarryHelper is
	component ANDMux is
		port( i1: in std_logic;
		i0: in std_logic;
		z: out std_logic
		);
	end component;
	component ORMux is
		port( i1: in std_logic;
		i0: in std_logic;
		z: out std_logic
		);
	end component;
	signal pg: std_logic; --store p.c
begin
	chip0: ANDMux
		port map(p,cin,pg);
	chip1: ORMux
		port map(pg,g,c);
end;

library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- Perform the step to  calculate the carry of the Adder
-- c(i+1) = g(i) + p(i).cin
entity CarryCalc is
	port ( g, p : in std_logic_vector(7 downto 0);
	cin : in std_logic;
	c: out std_logic_vector(7 downto 0)
	);
end entity;

architecture ARCHCarry of CarryCalc is
	component CarryHelper
		port(g,p,cin : in std_logic;
		c: out std_logic);
	end component;
begin
	c(0) <= cin;
	chip0: CarryHelper
		port map(g(0),p(0),cin,c(1));
	chip1: CarryHelper
		port map(g(1),p(1),cin,c(2));
	chip2: CarryHelper
		port map(g(2),p(2),cin,c(3));
	chip3: CarryHelper
		port map(g(3),p(3),cin,c(4));
	chip4: CarryHelper
		port map(g(4),p(4),cin,c(5));
	chip5: CarryHelper
		port map(g(5),p(5),cin,c(6));
	chip6: CarryHelper
		port map(g(6),p(6),cin,c(7));

end;
