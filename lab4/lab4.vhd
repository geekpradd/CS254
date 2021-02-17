library ieee; 
use ieee.std_logic_1164.all;

entity lab4 is
		port (i0 : in std_logic;
		i1 : in std_logic;
		sel : in std_logic; 
		z : out std_logic);
end lab4;

architecture ARCH of lab4 is 
	component TwobyOneMux is
	port (i0 : in std_logic;
		i1 : in std_logic;
		sel : in std_logic; 
		z : out std_logic);
end component;
	
begin 



end ARCH;