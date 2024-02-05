----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2023 08:53:33
-- Design Name: 
-- Module Name: AN_generator - Behavioral
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_divider is
  Port (
        clk: in std_logic;
        rst: in std_logic;
      --  AN: out std_logic_vector(7 downto 0);
        clk_out : out std_logic
        
        
   );
end clk_divider;

architecture Behavioral of clk_divider is 
--signal clk_sig: std_logic;
signal count: integer range 0 to 100000;

begin
process(clk,rst)
begin

if(rst = '1') then
    count<= 0;
    clk_out <= '0';
    
elsif(rising_edge(clk)) then
    count <= count+1;
    if(count = 100000) then --at 100000 I want to send 1 enable
            clk_out <= '1';
            count<= 0;
           else
            clk_out <= '0';           
        end if;
        

end if;   

end process;

end Behavioral;
