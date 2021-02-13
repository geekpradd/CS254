library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;


-- Main Enitity for the FourByOneMux 
entity FourbyOneMux is
	port ( i : in std_logic_vector(3 downto 0);
	sel: in std_logic_vector(1 downto 0);
	z : out std_logic);
end entity;

architecture ARCH of FourbyOneMux is 
	component  TwoByOneMux is
		port (i : in std_logic_vector(1 downto 0); sel : in std_logic; z : out std_logic);
	end component;
	-- FourbyOneMix will use three TwoByOneMux so we are declaring it above
	
	signal x, y: std_logic; -- intermediate output signals
begin 

	Chip1: TwoByOneMux
	port map(i(0) => i(0), i(1) => i(2), sel=> sel(1), z=> x);
	-- mapping the 0 and 2 as inputs to the TwoByOneMux and using the MSB to select between them
	-- (if MSB active then we will choose 2)

	Chip2: TwoByOneMux
	port map(i(0) => i(1), i(1) => i(3), sel=> sel(1), z=> y);
	-- Similarly here if MSB is active we will select 3 else we will select 1
	
	Chip3: TwoByOneMux
	port map(i(0) => x, i(1) => y, sel=> sel(0), z=> z);
	-- Now we choose between the above two outputs on the basis of LSB here
	-- if LSB is 1 then we will choose the output coming from (1/3) else from (0/2)

end;