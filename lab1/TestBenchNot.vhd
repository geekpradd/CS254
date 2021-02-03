entity TestBenchNot is 
end TestBenchNot;

architecture tb of TestBenchNot is
	signal a: bit; --test bits
	signal not_out: bit; -- output of the not gate operation

	component NotGate is 
		port(K: in bit; L: out bit);
	end component;
	
begin 
	not_instance: NotGate
	port map(K => a, L=>not_out);
	
	process
	begin 
	a <= '0';
	wait for 5 ns;
	
	a <= '1';
	wait for 5 ns;
	
	end process;
	
end tb;
	
	