library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- Perform the preprocessing step of the Adder i.e to calculate G[i:i] and P[i:i] for all i.
entity AdderPreprocess is
	port ( a, b : in std_logic_vector (7 downto 0);
	c,d: out std_logic_vector (7 downto 0)
	);
end entity;

architecture ARCHPre of AdderPreprocess is
	component GenAndProp is
		port ( a, b : in std_logic;
			g,p: out std_logic
		);
	end component;
begin
	chip0: GenAndProp
		port map(a(0),b(0),c(0),d(0));
	chip1: GenAndProp
		port map(a(1),b(1),c(1),d(1));
	chip2: GenAndProp
		port map(a(2),b(2),c(2),d(2));
	chip3: GenAndProp
		port map(a(3),b(3),c(3),d(3));
	chip4: GenAndProp
		port map(a(4),b(4),c(4),d(4));
	chip5: GenAndProp
		port map(a(5),b(5),c(5),d(5));
	chip6: GenAndProp
		port map(a(6),b(6),c(6),d(6));
	chip7: GenAndProp
		port map(a(7),b(7),c(7),d(7));

end;
