library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ThreebyEightDecode is
	port ( i : in std_logic_vector(2 downto 0);
	en: in std_logic;
	z : out std_logic_vector(7 downto 0));
end entity;
architecture ARCH of ThreebyEightDecode is 
	component AndFour is
		port ( x1,x2,x3,x4: std_logic;
		R: out std_logic);
	end component;	
	
	component NotGate is 
		port (K: in std_logic;
		L : out std_logic);
	end component;
	
	signal noti: std_logic_vector(2 downto 0);
begin 
		Not1: NotGate
			port map(i(0), noti(0));
		Not2: NotGate
			port map(i(1), noti(1));
		Not3: NotGate
			port map(i(2), noti(2));
		Chip0: AndFour
			port map(  noti(0), noti(1), noti(2), en, z(0));
		Chip1: AndFour
			port map(  i(0)   , noti(1), noti(2), en, z(1));
		Chip2: AndFour
			port map(  noti(0), i(1)   , noti(2), en, z(2));
		Chip3: AndFour
			port map(  i(0)   , i(1)   , noti(2), en, z(3));
		Chip4: AndFour
			port map(  noti(0), noti(1), i(2)   , en, z(4));
		Chip5: AndFour
			port map(  i(0)   , noti(1), i(2)   , en, z(5));
		Chip6: AndFour
			port map(  noti(0), i(1)   , i(2)   , en, z(6));
		Chip7: AndFour
			port map(  i(0)   , i(1)   , i(2)   , en, z(7));
	
end;