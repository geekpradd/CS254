library ieee; 
use ieee.std_logic_1164.all;

entity lab2 is
	port ( a : in std_logic_vector(3 downto 0);
	b: in std_logic_vector(1 downto 0);
	c : out std_logic);
end lab2;

architecture ARCH of lab2 is 
	component FourbyOneMux is
	port ( i : in std_logic_vector(3 downto 0);
	sel: in std_logic_vector(1 downto 0);
	z : out std_logic);
end component;
	
begin 

Chip1: FourbyOneMux 
port map(a, b, c);


end ARCH;