library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;


-- Main Enitity for the TwoByOneMux 
entity TwoByOneMux is
port (i : in std_logic_vector(1 downto 0); sel : in std_logic; z : out std_logic);
end entity;

architecture ARCH of TwoByOneMux is 
	component OrGate is 
		port (X,Y : in std_logic;
		O : out std_logic);
	end component;
	
	component AndGate is 
		port (P,Q : in std_logic;
		R : out std_logic);
	end component;
	
	component NotGate is 
		port (K: in std_logic;
		L : out std_logic);
	end component;
	-- TwoByOneMux is built using AndGates/OrGates and NotGate.
	-- Since we are writing structural code, these components have their
	-- architecures in separate files
	
	signal not_sel, x, y: std_logic;
begin 

	Chip1: OrGate
	port map(x, y, z);
	-- Since VHDL is concurrent we can map the signals in any order.
	-- Here x and y will be ORed to give the final output 

	Chip2: AndGate
	port map(i(1), sel, x);
	-- X is the and of the selector with i(1) and thus X will be present when selector is set
	
	Chip3: AndGate
	port map(i(0), not_sel, y);
	-- Y is the and of the negation of the selector with i(0)
	-- When selector is not set, we will get i(0) in Y

	Chip4: NotGate
	port map(sel, not_sel);
	-- maping not_sel to be the negation of sel
end;