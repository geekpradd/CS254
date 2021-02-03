entity TestBenchOr is 
end TestBenchOr;

architecture tb of TestBenchOr is
	signal a, b: bit; --test bits
	signal or_out: bit; -- output of the or gate operation

	component OrGate is 
		port(X, Y: in bit; O: out bit);
	end component;
	
begin 
	or_instance: OrGate
	port map(X => a, Y =>b, O=>or_out);
	
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
	
	