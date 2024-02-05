library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Register8b is 
	Port ( 	clk		: in std_logic;
			S_in	:in std_logic;
			reset	: in std_logic;
			E		:in std_logic_vector(7 downto 0); -- msb on the left if lsb on the left it will be 0 downto 7
			load	: in std_logic;
			S_out	:out std_logic);

end Shift_Register8b;

architecture behavioral of Shift_Register8b is

	signal mem : std_logic_vector(7 downto 0);  -- define internal 8 bit signal to store E when its load. software level define not implemented in hardware
	
	begin 
		process(reset, clk, load)
			begin
				if(reset = '1') then --reset mem.
					mem <= "00000000";
				elsif(rising_edge(clk)) then --load is synchronized with clk.
					if(load = '1') then 
						mem <= E; 	-- load eE to internal signal.
					else 
						mem <= mem(6 downto 0) & S_in; -- shift one bit and add S_in in E0.(concatenation)
					end if;
					
				end if;
		end process;
		
S_out <= mem(7); -- the process and this happen parallel
		
end behavioral;