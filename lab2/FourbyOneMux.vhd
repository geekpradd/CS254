library ieee; 
use ieee.std_logic_1164.all;

entity FourbyOneMux is
	port ( i : in std_logic_vector(3 downto 0);
	sel: in std_logic_vector(1 downto 0);
	z : out std_logic);
end entity;

architecture ARCH of FourbyOneMux is 
	component  TwoByOneMux is
		port (i : in std_logic_vector(1 downto 0); sel : in std_logic; z : out std_logic);
	end component;
	
	
	signal x, y: std_logic;
begin 

	Chip1: TwoByOneMux
	port map(i(0) => i(0), i(1) => i(2), sel=> sel(1), z=> x);

	Chip2: TwoByOneMux
	port map(i(0) => i(1), i(1) => i(3), sel=> sel(1), z=> y);
	
	Chip3: TwoByOneMux
	port map(i(0) => x, i(1) => y, sel=> sel(0), z=> z);

end;