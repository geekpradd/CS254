entity Lab1 is 
port(A, B: in bit; AND_OUT, OR_OUT, NOT_OUT: out bit);
end Lab1;

architecture ARCH of Lab1 is 
	component OrGate is 
		port (X,Y : in bit;
		O : out bit);
	end component;
	
	component AndGate is 
		port (P,Q : in bit;
		R : out bit);
	end component;
	
	component NotGate is 
		port (K: in bit;
		L : out bit);
	end component;
begin 

Chip1: OrGate
port map(A, B, OR_OUT);

Chip2: AndGate
port map(A, B, AND_OUT);

Chip3: NotGate
port map(A, NOT_OUT);

end ARCH;