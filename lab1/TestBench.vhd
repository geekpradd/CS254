entity TestBench is 
end TestBench;

architecture tb of TestBench is
	signal a, b: bit; --test bits
	signal or_out: bit;
	signal and_out: bit;
	signal not_out: bit;

	component Lab1 is 
		port(A, B: in bit; AND_OUT, OR_OUT, NOT_OUT: out bit);
	end component;
	
begin 
	test_instance: Lab1
	port map(A => a, B=>b, AND_OUT=>and_out, OR_OUT=>or_out, NOT_OUT=>not_out);
	
	process
	begin 
	a <= '0';
	b <= '0';
	wait for 5 ns;
	
	a <= '1';
	b <= '0';
	wait for 5 ns;
	
	a <= '0';
	b <= '1';
	wait for 5 ns;
	
	a <= '1';
	b <= '1';
	wait for 5 ns;
	
	end process;
	
end tb;
	
	