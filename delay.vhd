----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.01.2023 10:20:27
-- Design Name: 
-- Module Name: sec_generator - Behavioral
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

entity delay is
    Port (
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            sec_delay : out STD_LOGIC;
            mem_wr : out STD_LOGIC);
end delay;

architecture Behavioral of delay is
signal count: integer range 0 to 200000000; --maybe assign a start value

begin

process(clk,rst)

begin

    if 	rst='1' then 
        count <= 0;
	elsif rising_edge(clk) then 
	   if count < 100000000 then -- count 1sec
          count <= count + 1;
          sec_delay <= '0';
          mem_wr<='0';
           
        else 
            count <= 0;
            sec_delay <= '1';
            mem_wr<='1';
         end if;
	  end if;

end process;

end Behavioral;
