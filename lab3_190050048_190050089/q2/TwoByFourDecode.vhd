library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;


-- TwoByFourDecode entity 
entity TwoByFourDecode is
	port( i: in std_logic_vector(1 downto 0);
	en: in std_logic;
	z: out std_logic_vector(3 downto 0)
	);
end entity;

architecture Decode of TwoByFourDecode is
	component TwoByOneMux is
		port (i0 : in std_logic;
				i1 : in std_logic;
				sel : in std_logic; 
				z : out std_logic);
	end component;
	
	component ANDMux is
	port( i1: in std_logic;
	i0: in std_logic;
	z: out std_logic
	);
	end component;
	signal y: std_logic_vector(3 downto 0);  -- used to store the result temporarily
	signal not0: std_logic;  -- store the not of i(0)
begin
	NotMUX: TwoByOneMux
		port map('1','0',i(0),not0); -- calculate not of i(0)
	
	chip0: TwoByOneMux
		port map(not0,'0',i(1),y(0)); -- z(0) = ~i(1) AND ~i(0).
	chip1: TwoByOneMux
		port map(i(0),'0',i(1),y(1)); -- z(1) = ~i(1) AND i(0).
	chip2: ANDMux
		port map(not0,i(1),y(2)); -- z(2) = i(1) AND ~i(0).
	chip3: ANDMux
		port map(i(0),i(1),y(3)); -- z(3) = i(1) AND i(0).

	-- applying the enable criteria on each output bit.
	ENABLE0: ANDMux
		port map(y(0),en,z(0));
	ENABLE1: ANDMux
		port map(y(1),en,z(1));
	ENABLE2: ANDMux
		port map(y(2),en,z(2));
	ENABLE3: ANDMux
		port map(y(3),en,z(3));	
end;