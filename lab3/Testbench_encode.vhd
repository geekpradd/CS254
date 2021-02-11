library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end TestBench;

architecture tb of TestBench is
	signal x:std_logic_vector(3 downto 0):= "0000";
	signal ou: std_logic_vector(1 downto 0);
	signal s: std_logic;
	component FourByTwoEncode is
	port( i: in std_logic_vector(3 downto 0);
	en: in std_logic;
	z: out std_logic_vector(1 downto 0)
	);
	end component;
	
begin 
	dut_instance: FourByTwoEncode
	port map(i => x,en => s, z => ou);
	
	process
	begin 
	s <= '0';
	for i in 0 to 3 loop
		x <= "0000";
		x(i) <= '1';
		wait for 5 ns;
	end loop;
	s <= '1';
	for i in 0 to 3 loop
		x <= "0000";
		x(i) <= '1';
		wait for 5 ns;
	end loop;	
	
	end process;
	
end tb;
	
	