----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2023 08:08:04
-- Design Name: 
-- Module Name: AN_counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AN_counter is
  Port (
         clk: in std_logic;
         clk_1kh: in std_logic;
         reset: in std_logic;
         AN_out : out std_logic_vector(7 downto 0)
  );
end AN_counter;

architecture Behavioral of AN_counter is

signal An_internal : std_logic_vector(7 downto 0):="11111110";

begin

process(reset, clk_1kh,clk)
		begin
			if(reset = '1') then --reset  process.
				An_internal <= "11111110";
			elsif(rising_edge(clk)) then --  master clk.
			
				  if (clk_1kh='1') then
				       
                      if ( An_internal = "01111111") then 
                          An_internal<= An_internal(6 downto 0) & '0';
					        else 
					         An_internal<= An_internal(6 downto 0) & '1'; -- shift one bit and add S_in in E0.(concatenation)
					     end if;
					 end if;
				end if;
		end process;
		
        AN_out <= An_internal; -- the process and this happen parallel
				   
end Behavioral;
