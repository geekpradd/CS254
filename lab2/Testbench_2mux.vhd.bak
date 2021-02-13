library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end TestBench;

architecture tb of TestBench is
	signal x:std_logic_vector(1 downto 0);
	signal ou: std_logic;
	signal s: std_logic;
	component TwoByOneMux is 
		port(i : in std_logic_vector(1 downto 0); sel : in std_logic; z : out std_logic);
	end component;
	
begin 
	dut_instance: TwoByOneMux
	port map(i => x, sel => s,z => ou);
	
	process
	begin 
	
	s <= '0';
	for i in 0 to 3 loop
		x <= std_logic_vector(to_unsigned(i, x'length));
		wait for 5 ns;
	end loop;
	s <= '1';
	for i in 0 to 3 loop
		x <= std_logic_vector(to_unsigned(i, x'length));
		wait for 5 ns;
	end loop;	
	end process;
	
end tb;
	
	