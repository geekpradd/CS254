library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end TestBench;

architecture tb of TestBench is
	signal x:std_logic;
	signal y: std_logic;
	signal z: std_logic;
	signal sum:std_logic;
	signal carry: std_logic;
	
	component  OnebitFullAdd is
		port ( a, b, cin : in std_logic;
			sum, carry: out std_logic);
	end component;
	
	
begin 
	dut_instance: OnebitFullAdd
	port map(a => x, b => y, cin=>z, sum => sum, carry=>carry);
	
	
	process
	begin 
	x <= '0';
	y <= '0';
	z <= '0';
	wait for 5 ns;
	
	x <= '1';
	y <= '0';
	z <= '0';
	wait for 5 ns;
	
	x <= '0';
	y <= '1';
	z <= '0';
	wait for 5 ns;
	
	x <= '1';
	y <= '1';
	z <= '0';
	wait for 5 ns;
	x <= '0';
	y <= '0';
	z <= '1';
	wait for 5 ns;
	
	x <= '1';
	y <= '0';
	z <= '1';
	wait for 5 ns;
	
	x <= '0';
	y <= '1';
	z <= '1';
	wait for 5 ns;
	
	x <= '1';
	y <= '1';
	z <= '1';
	wait for 5 ns;
	
	end process;
	
end tb;
