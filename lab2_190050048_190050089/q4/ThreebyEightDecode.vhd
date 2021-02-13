library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Main Enitity for the decoder 
entity ThreebyEightDecode is
	port ( i : in std_logic_vector(2 downto 0);
	en: in std_logic;
	z : out std_logic_vector(7 downto 0));
end entity;

architecture ARCH of ThreebyEightDecode is 
	component AndFour is -- takes four inputs and returns their AND. So, R = x1 AND x2 AND x3 AND x4
		port ( x1,x2,x3,x4: std_logic;
		R: out std_logic);
	end component;	
	
	component NotGate is -- returns the negation of the input. So, L = NOT K
		port (K: in std_logic;
		L : out std_logic);
	end component;
	
	signal noti: std_logic_vector(2 downto 0); --vector to store the negations of the inputs
begin 
		-- calculating the negation of the input.
		Not1: NotGate
			port map(i(0), noti(0));
		Not2: NotGate
			port map(i(1), noti(1));
		Not3: NotGate
			port map(i(2), noti(2));
			
		-- Chip c is used to calculate the value for z(c) i.e. whether z(c) bit must be active or not
		-- z(c) must be 1 only if i corresponds to c. Correspondingly, AND is applied to check whether i = c or not
		-- en is also passed in AndFour because we have to set z(c) only if en = 1. This can be achieved by taking AND of en with the value
		-- So, in all we have to take AND of en and three inputs(with or without NOT depending on c) to get z(c) 
		Chip0: AndFour
			port map(  noti(0), noti(1), noti(2), en, z(0)); -- z(0) = en AND ~i(0) AND ~i(1) AND ~i(2)
		Chip1: AndFour
			port map(  i(0)   , noti(1), noti(2), en, z(1)); -- z(1) = en AND i(0) AND ~i(1) AND ~i(2)
		Chip2: AndFour
			port map(  noti(0), i(1)   , noti(2), en, z(2)); -- z(2) = en AND ~i(0) AND i(1) AND ~i(2)
		Chip3: AndFour
			port map(  i(0)   , i(1)   , noti(2), en, z(3)); -- z(3) = en AND i(0) AND i(1) AND ~i(2)
		Chip4: AndFour
			port map(  noti(0), noti(1), i(2)   , en, z(4)); -- z(4) = en AND ~i(0) AND ~i(1) AND i(2)
		Chip5: AndFour
			port map(  i(0)   , noti(1), i(2)   , en, z(5)); -- z(5) = en AND i(0) AND ~i(1) AND i(2)
		Chip6: AndFour
			port map(  noti(0), i(1)   , i(2)   , en, z(6)); -- z(6) = en AND ~i(0) AND i(1) AND i(2)
		Chip7: AndFour
			port map(  i(0)   , i(1)   , i(2)   , en, z(7)); -- z(7) = en AND i(0) AND i(1) AND i(2)
	
		-- The above equations can be verified using the truth table
end;