library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end TestBench;

architecture tb of TestBench is
	signal g,y,r: std_logic_vector(3 downto 0);
	signal clk, rst: std_logic := '1';
	
	component  TrafficLightController is
		port ( clk, rst : in std_logic;
			green, yellow, red: out std_logic_vector(3 downto 0));
	end component;
begin 

	dut_instance: TrafficLightController
	port map(clk, rst, g, y, r);
	
	process
	begin 
	clk <= '0';
	wait for 1 us;
	clk <= '1';
	wait for 2.5 sec;
	rst <= '0';
	clk <= '0';
	wait for 2499999 us;
	end process;
end tb;
