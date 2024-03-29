library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- Entity to calculate the 1st place bit for the next state
-- next_s1 = ~s2 . ( s1 + s0)
entity State1 is
port ( prev_state : in std_logic_vector(2 downto 0);
next_s1: out std_logic);
end entity;

architecture ARCHSt1 of State1 is
	component NOTMux is
		port(
		i: in std_logic;
		z: out std_logic
		);
	end component;

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
	
	signal notS2, s1ors0 : std_logic;
begin
	chip0: NOTMux
		port map(prev_state(2), notS2);
	
	chip1: ORMux
		port map(prev_state(1), prev_state(0), s1ors0);
		
	chip2: ANDMux
		port map(notS2, s1ors0, next_s1);
end;
