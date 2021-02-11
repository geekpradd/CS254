library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- FourByTwoEncode entity 
entity FourByTwoEncode is
	port( i: in std_logic_vector(3 downto 0);
	en: in std_logic;
	z: out std_logic_vector(1 downto 0)
	);
end entity;

architecture Encode of FourByTwoEncode is
	component ORMux is
	port( i1: in std_logic;
	i0: in std_logic;
	z: out std_logic
	);
	end component;
	
	component ANDMux is
	port( i1: in std_logic;
	i0: in std_logic;
	z: out std_logic
	);
	end component;
	signal x1,x0: std_logic;  -- store intermidiate signals
begin
	chip1: ORMux
		port map(i(3),i(2),x1); -- z(1) = i(3) + i(2)
	chip2: ORMux
		port map(i(3),i(1),x0); -- z(0) = i(3) + i(1)
	
	-- applying the enable criteria on each output bit.
	ENABLE0: ANDMux
		port map(x1,en,z(1));  
	ENABLE1: ANDMux
		port map(x0,en,z(0));	
end;
