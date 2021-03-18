library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- NOT Gate using MUX
entity NOTMux is
	port(
	i: in std_logic;
	z: out std_logic
	);
end entity;

architecture ARCH of NOTMux is
	component TwoByOneMux is 
		port (i0 : in std_logic;
				i1 : in std_logic;
				sel : in std_logic; 
				z : out std_logic);
	end component;
begin
	chip2: TwoByOneMux
		port map('1','0',i,z);
end;
