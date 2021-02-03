entity TestBenchAnd is 
end TestBenchAnd;

architecture tb of TestBenchAnd is
	signal a, b: bit; --test bits
	signal and_out: bit; -- output of the and gate operation

	component AndGate is 
		port(P, Q: in bit; R: out bit);
	end component;
	
begin 
	and_instance: AndGate
	port map(P => a, Q =>b, R=>and_out);
	
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
	
	