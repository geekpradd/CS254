library work;
use work.all;
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity RLEncoder is
	port ( clk, rst : in std_logic;
	input : in std_logic_vector(7 downto 0);
	output: out std_logic_vector(7 downto 0);
	valid: out std_logic);
end entity;

architecture Encode of RLEncoder is
component FourbitUpCount is
	port ( clk, rst : in std_logic;
	count: out std_logic_vector (3 downto 0));
end component;

component DFlipFlop is
	port (clk, rst, d: in std_logic; q: out std_logic);
end component;

-- defining a type to make the buffer
type memory is 
	array (97 downto 0) of std_logic_vector(7 downto 0);
signal neg_clk: std_logic; -- negative of the clock signal. Used as input to the counter

signal current_char : std_logic_vector(7 downto 0) := "00000000"; -- store the current character
signal cnt: std_logic_vector(3 downto 0); -- store the count of current character

signal index: integer range 0 to 97; -- store the index till which the buffer is filled
signal increment: integer range - 1 to 2; -- since for n=1,2 are handled differently, the index is incremented differently
signal reset: std_logic; -- reset for the counter which is counting the number of times current character occured
signal empty: std_logic; -- tell whether the buffer is empty or not
begin
	neg_clk <= not clk;
	
	chars:
	FOR i IN 0 to 7 GENERATE   -- Store the current character in D flip flops. The state changes at the falling edge of clock
		char: DFlipFlop PORT MAP (neg_clk,rst,input(i),current_char(i));
	END GENERATE;	
	
	count: FourbitUpCount PORT MAP(neg_clk, reset, cnt);  --counter to store count of current char - 1.

	process(clk, rst, neg_clk, current_char)
	variable buff: memory;  -- buffer for the output. It basically acts like a shift buffer but with extra inputs at each register possible.
	
	begin
		-- the current_char will be 0000000 at the start when rst = 1. In such a case, we should not compare it to the input as it will cause an extra 00000000 output
		if(current_char /= "00000000" and rising_edge(clk)) then 
			if( current_char = input and unsigned(cnt) < 14) then -- the character is repeated and count < 15. In such a case, the counter increases and no output
				increment <= -1; -- no new character but the buffer values would have shifted
				reset <= rst;
			else
				reset <= '1'; -- we have to reset the counter 
				if(unsigned(current_char) = 27) then -- if the current char is ESC
					buff(index) := std_logic_vector(to_unsigned(27, 8)); -- Esc
					buff(index+1) := "0000" & std_logic_vector(unsigned(cnt)+1); --n
					buff(index+2) := current_char; -- Esc
					increment <= 2;
				else
					if (unsigned(cnt) > 1) then -- note that in specification was mentioned 2 < n < 16. So for n<=2, the character is outputted as it is.
						buff(index) := std_logic_vector(to_unsigned(27, 8));  -- Esc
						buff(index+1) := "0000" & std_logic_vector(unsigned(cnt)+1);  --n 
						buff(index+2) := current_char; -- c
						increment <= 2;
					else -- n<=2 case
						buff(index) := current_char;
						increment <= 0;
						if (unsigned(cnt)=1) then
							buff(index+1) := current_char;
							increment <= 1;
						end if;
					end if;
				end if;
			end if;			
			if empty = '1' then -- if the buffer is empty, no output is there. So, valid = 0
				valid <= '0';
			else 
				output <= buff(0); -- if the buffer is not empty, output the top i.e. 0th element and set valid to 1
				valid <= '1'; 
			end if;
			for i in 1 to 97 loop -- shift the buffer.
				buff(i-1) := buff(i); 
			end loop;		
		end if;
		
		if(current_char = "00000000" or current_char = "00000001") then -- handle the initialisation and end. At end, current_char = "00000001"
			reset <= '1';
		end if;
		
		if(rising_edge(neg_clk)) then 
			empty <= '1';
			 -- update the index for the first empty register in buffer and check if it is empty
			if(rst = '1' or current_char = "00000000") then -- before the first character is read
				index <= 1;
			else 
				if(reset = '1' and current_char /= "00000001") then -- new character is added to buffer
					if index > 94 then
						index <= 94;
					else
					
						index <= index+increment;
					end if;
					empty <= '0';
				else -- no new character is added. But the buffer shifted, so index reduces by 1.
					if index < 2 then
						index <= 1;
						empty <= '1';
					else
						empty <= '0';
						index <= index + increment;						
					end if;
				end if;
			end if;
		end if;
	end process;
end Encode;
