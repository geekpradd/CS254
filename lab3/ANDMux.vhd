library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- AND Gate using MUX
entity ANDMux is
	port( i1: in std_logic;
	i0: in std_logic;
	z: out std_logic
	);
end entity;

architecture ARCH of ANDMux is
	component TwoByOneMux is 
		port (i0 : in std_logic;
				i1 : in std_logic;
				sel : in std_logic; 
				z : out std_logic);
	end component;
	signal x: std_logic;
begin
	chip2: TwoByOneMux
		port map('0',i0,i1,z);
end;
