library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBenchHalf is 
end TestBenchHalf;

architecture tb of TestBenchHalf is
	signal x:std_logic;
	signal y: std_logic;
	signal sum:std_logic;
	signal carry: std_logic;
	
	component  OnebitHalfAdd is
		port ( a, b : in std_logic;
			sum, carry: out std_logic);
	end component;
	
	
begin 
	dut_instance: OnebitHalfAdd
	port map(a => x, b => y,sum => sum, carry=>carry);
	
	
	process
	begin 
	x <= '0';
	y <= '0';
	wait for 5 ns;
	
	x <= '1';
	y <= '0';
	wait for 5 ns;
	
	x <= '0';
	y <= '1';
	wait for 5 ns;
	
	x <= '1';
	y <= '1';
	wait for 5 ns;
	
	end process;
	
end tb;