library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- OR Gate using MUX
entity ORMux is
	port( i1: in std_logic;
	i0: in std_logic;
	z: out std_logic
	);
end entity;

architecture ARCH of ORMux is
	component TwoByOneMux is 
		port (i0 : in std_logic;
				i1 : in std_logic;
				sel : in std_logic; 
				z : out std_logic);
	end component;
begin
	chip2: TwoByOneMux
		port map(i0,'1',i1,z);
end;
