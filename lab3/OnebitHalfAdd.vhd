library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

-- building half adder from 2 by 1 MUX using ROBDD
entity OnebitHalfAdd is
port ( a, b : in std_logic;
	sum, carry: out std_logic);
end entity;
architecture ARCH of OnebitHalfAdd is 
	component TwoByOneMux is
		port (i0 : in std_logic;
				i1 : in std_logic;
				sel : in std_logic; 
				z : out std_logic);
	end component;
	
	signal x, y, z: std_logic; -- intemediate signals
begin 

	Chip1: TwoByOneMux
	port map('1', '0', b, x); -- this is the lowest level of the ROBDD for XOR, which depends on b, this is the right child
	-- our ordering is a < b

	Chip2: TwoByOneMux
	port map('0', '1', b, y); -- the left child from a in XOR
	
	Chip3: TwoByOneMux
	port map(y, x, a, sum); -- the topmost node in XOR (which corresponds to SUM)
	
	Chip4: TwoByOneMux
	port map('0', '1', b, z); -- lower node in AND(which corresonds to Carry)

	Chip5: TwoByOneMux
	port map('0', z, a, carry); -- top node in AND (a < b is followed; there are two MUXes for Carry)
	


end;