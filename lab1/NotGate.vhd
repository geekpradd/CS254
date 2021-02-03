entity NotGate is
	port(K: in bit; L: out bit);
end entity NotGate;

architecture Struct of NotGate is 
begin
	L <= (not K);
end Struct;