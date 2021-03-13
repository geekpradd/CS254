library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;

entity EightbitKogStonAddSub is
	port ( a, b : in std_logic_vector (7 downto 0);
	cin: in std_logic;
	sum: out std_logic_vector (7 downto 0);
	cout: out std_logic);
end entity;

architecture ARCHAdd of EightbitKogStonAddSub is
	component AdderPreprocess is
		port ( a, b : in std_logic_vector (7 downto 0);
		c,d: out std_logic_vector (7 downto 0)
		);
	end component;
	component AdderPrefix is
		port ( g, p : in std_logic_vector (7 downto 0);
		gi2zero, pi2zero: out std_logic_vector (7 downto 0)
		);
	end component;
	component CarryCalc is
		port ( g, p : in std_logic_vector (7 downto 0);
		cin : in std_logic;
		c: out std_logic_vector (7 downto 0)
		);
	end component;
	component CarryHelper is
		port(g,p,cin : in std_logic;
		c: out std_logic);
	end component;
	component VectorXORMux2 is
		port( i: in std_logic_vector(7 downto 0);
		num: in std_logic;
		z: out std_logic_vector(7 downto 0)
		);
	end component;
	component VectorXORMux is
		port( i0, i1: in std_logic_vector(7 downto 0);
		z: out std_logic_vector(7 downto 0)
		);
	end component;
	signal b_com: std_logic_vector(7 downto 0);
	signal g, gi: std_logic_vector(7 downto 0);
 	signal p, pi: std_logic_vector(7 downto 0);
	signal carry: std_logic_vector(7 downto 0);
begin
	complement: VectorXORMux2
		port map(b,cin,b_com);
		
	preprocess: AdderPreprocess
		port map(b_com,a,gi,pi); -- gi[j],pi[j] stores G[j:j],P[j:j] for all j
		
	prefix: AdderPrefix
		port map(gi,pi,g,p); -- g[j],p[j] stores G[j:0],P[j:0] for all j

	carryChip: CarryCalc
		port map(g,p,cin,carry);
		
	sumChip: VectorXORMux
		port map(pi,carry,sum);
		
	finalcarry: CarryHelper
		port map(g(7),p(7),cin,cout);
		
end;
