library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- Perform the prefix computation step of the Adder i.e to calculate G[i:0] and P[i:0] for all i.
entity AdderPrefix is
	port ( g, p : in std_logic_vector (7 downto 0);
	gi2zero, pi2zero: out std_logic_vector (7 downto 0)
	);
end entity;

architecture ARCHPre of AdderPrefix is
	component AdderCombine is
		port ( g1, g2 : in std_logic ;
		 p1, p2 : in std_logic ;
		g,p: out std_logic
		);
	end component;
	signal step1g: std_logic_vector(7 downto 0);
	signal step2g: std_logic_vector(7 downto 0);
	signal step1p: std_logic_vector(7 downto 0);
	signal step2p: std_logic_vector(7 downto 0);
begin

-- layer 1 operations for Kogge Stone Adder.
	step1g(0) <= g(0);
	step1p(0) <= p(0);
	step1_chip0: AdderCombine
		port map(g(1),g(0),p(1),p(0),step1g(1),step1p(1));
	step1_chip1: AdderCombine
		port map(g(2),g(1),p(2),p(1),step1g(2),step1p(2));
	step1_chip2: AdderCombine
		port map(g(3),g(2),p(3),p(2),step1g(3),step1p(3));
	step1_chip3: AdderCombine
		port map(g(4),g(3),p(4),p(3),step1g(4),step1p(4));
	step1_chip4: AdderCombine
		port map(g(5),g(4),p(5),p(4),step1g(5),step1p(5));
	step1_chip5: AdderCombine
		port map(g(6),g(5),p(6),p(5),step1g(6),step1p(6));
	step1_chip6: AdderCombine
		port map(g(7),g(6),p(7),p(6),step1g(7),step1p(7));
	
-- layer 2 operations for Kogge Stone Adder.
	step2g(0) <= step1g(0);
	step2p(0) <= step1p(0);
	step2g(1) <= step1g(1);
	step2p(1) <= step1p(1);
	
	step2_chip0: AdderCombine
		port map(step1g(2),step1g(0),step1p(2),step1p(0),step2g(2),step2p(2));
	step2_chip1: AdderCombine
		port map(step1g(3),step1g(1),step1p(3),step1p(1),step2g(3),step2p(3));
	step2_chip2: AdderCombine
		port map(step1g(4),step1g(2),step1p(4),step1p(2),step2g(4),step2p(4));
	step2_chip3: AdderCombine
		port map(step1g(5),step1g(3),step1p(5),step1p(3),step2g(5),step2p(5));
	step2_chip4: AdderCombine
		port map(step1g(6),step1g(4),step1p(6),step1p(4),step2g(6),step2p(6));
	step2_chip5: AdderCombine
		port map(step1g(7),step1g(5),step1p(7),step1p(5),step2g(7),step2p(7));

	
-- layer 3 operations for Kogge Stone Adder.
	gi2zero(0) <= step2g(0);
	pi2zero(0) <= step2p(0);
	gi2zero(1) <= step2g(1);
	pi2zero(1) <= step2p(1);
	gi2zero(2) <= step2g(2);
	pi2zero(2) <= step2p(2);
	gi2zero(3) <= step2g(3);
	pi2zero(3) <= step2p(3);
	
	step3_chip0: AdderCombine
		port map(step2g(4),step2g(0),step2p(4),step2p(0),gi2zero(4),pi2zero(4));
	step3_chip1: AdderCombine
		port map(step2g(5),step2g(1),step2p(5),step2p(1),gi2zero(5),pi2zero(5));
	step3_chip2: AdderCombine
		port map(step2g(6),step2g(2),step2p(6),step2p(2),gi2zero(6),pi2zero(6));
	step3_chip3: AdderCombine
		port map(step2g(7),step2g(3),step2p(7),step2p(3),gi2zero(7),pi2zero(7));


end;
