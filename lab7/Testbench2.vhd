
library IEEE;
use IEEE.std_logic_1164.all;

entity TestBench2 is
end TestBench2;

architecture tb of TestBench2 is
    signal c,r,u :  std_logic;
	 signal cnt:  std_logic_vector(6 downto 0);
 
	component UpDownCounter is
		port ( clk, rst : in std_logic; up: in std_logic;
		count: out std_logic_vector (6 downto 0));

		end component;

begin
    
	dut_instance:  UpDownCounter
	port map (clk=>c, rst=>r, up=>u, count=>cnt);

	clock_process :process
	begin
		  c <= '0';
		  wait for 10 ns;
		  c <= '1';
		  wait for 10 ns;
	end process;


	-- Stimulus process
	stim_proc: process
	begin        
		-- hold reset state for 100 ns.
		  r <= '1';
		u <= '0';
		 wait for 300 ns;    
		 r <= '0';
	  wait for 20 ns;    
	  u <= '1';
		wait for 300 ns;
end process;
end tb;
