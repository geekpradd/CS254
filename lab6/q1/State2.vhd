library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- Entity to calculate the 2st place bit for the next state
-- next_s2 = s1 . ( s2 + s0)
entity State2 is
port ( prev_state : in std_logic_vector(2 downto 0);
next_s2: out std_logic);
end entity;

architecture ARCHSt2 of State2 is
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
	
	signal s2ors0 : std_logic;
begin
	chip1: ORMux
		port map(prev_state(2), prev_state(0), s2ors0);
		
	chip2: ANDMux
		port map(prev_state(1), s2ors0, next_s2);
end;
