library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end TestBench;

architecture tb of TestBench is
	signal x:std_logic_vector(2 downto 0);
	signal e: std_logic;
	signal ou: std_logic_vector(7 downto 0);
	
	component ThreebyEightDecode is
	port ( i : in std_logic_vector(2 downto 0);
	en: in std_logic;
	z : out std_logic_vector(7 downto 0));
	end component;
	
begin 
	dut_instance: ThreebyEightDecode
	port map(i => x, en => e,z => ou);
	
	process
	begin 
	
	e <= '0';
	for i in 0 to 7 loop
		x <= std_logic_vector(to_unsigned(i, x'length));
		wait for 5 ns;
	end loop;
	e <= '1';
	for i in 0 to 7 loop
		x <= std_logic_vector(to_unsigned(i, x'length));
		wait for 5 ns;
	end loop;

	end process;
end tb;
	
	