library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- XOR Gate using MUX
entity XORMux is
	port( i1: in std_logic;
	i0: in std_logic;
	z: out std_logic
	);
end entity;

architecture ARCH of XORMux is
	component TwoByOneMux is 
		port (i0 : in std_logic;
				i1 : in std_logic;
				sel : in std_logic; 
				z : out std_logic);
	end component;
	
	component NOTMux is
		port(
		i: in std_logic;
		z: out std_logic
		);
	end component;
	signal x: std_logic;
begin
	chip1: NOTMux
		port map(i0, x);  -- x = ~i0
		
	chip2: TwoByOneMux
		port map(i0,x,i1,z); -- z = i1.~i0 + ~i1.i0
end;
