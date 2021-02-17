library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

entity OnebitFullAdd is
port ( a, b, cin : in std_logic;
sum, carry: out std_logic);
end entity;

-- Building Full Adder using Half Adder
architecture ARCH of OnebitFullAdd is 
	component OnebitHalfAdd is
	port ( a, b : in std_logic;
		sum, carry: out std_logic);
	end component;
	
	signal x, y, z, t: std_logic;
begin 

	Chip1: OnebitHalfAdd
	port map(a, b, x, y); -- the first half adder computes a+b in x, y

	Chip2: OnebitHalfAdd
	port map(x, cin, sum, z); -- Now we add x to cin, note that the LSB of this will be the finalsum always
	
	Chip3: OnebitHalfAdd
	port map(y, z, carry, t); -- Now we add the MSB of (x+cin) which is z and add it to y (which is the MSB of a+b), the LSB of this will always be our carry
	

end;