library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end TestBench;

architecture tb of TestBench is
--	signal input:std_logic_vector(2 downto 0);
	signal output: std_logic_vector(3 downto 0);
	signal clk, rst: std_logic := '1';
--	signal state: std_logic_vector (2 downto 0);
	
	component  FourbitUpCount is
	port ( clk, rst : in std_logic;
		count: out std_logic_vector (3 downto 0));

	end  component;
begin 
--	dut_instance: StateTransit
--	port map(input, output);

	dut_instance: FourbitUpCount
	port map(clk, rst, output);
	
	process
	begin 
	clk <= '0';
	wait for 5 ns;
	clk <= '1';
	wait for 2 ns;
	rst <= '0';
	wait for 2 ns;
--	for i in 0 to 7 loop
--		input <= std_logic_vector(to_unsigned(i, input'length));
--		wait for 5 ns;
--	end loop;
	end process;
end tb;
	