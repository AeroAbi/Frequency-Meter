----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 01:10:29 AM
-- Design Name: 
-- Module Name: bcd_logic - Behavioral
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

entity bcd_logic is
  Port (
   data : in std_logic_vector(3 downto 0);
   dp_init: in std_logic;
   bcd_out: out std_logic_vector(6 downto 0);
   dp_lo: out std_logic
   );
end bcd_logic;

architecture Behavioral of bcd_logic is


begin
    process(data,dp_init)
        begin
        case(dp_init) is
            when '0' => dp_lo <= '1';
            when '1' => dp_lo <= '0';
            when others => dp_lo <= '1';
            end case; 
        case(data) is
        when "0000" => bcd_out <= "0000001";
        when "0001" => bcd_out <= "1001111";
        when "0010" => bcd_out <= "0010010";
        when "0011" => bcd_out <= "0000110";
        when "0100" => bcd_out <= "1001100";
        when "0101" => bcd_out <= "0100100";
        when "0110" => bcd_out <= "0100000";
        when "0111" => bcd_out <= "0001111";
        when "1000" => bcd_out <= "0000000";
        when "1001" => bcd_out <= "0000100";
        when "1010" => bcd_out <= "0001000";
        when "1011" => bcd_out <= "1100000";
        when "1100" => bcd_out <= "0110001";
        when "1101" => bcd_out <= "1000010";
        when "1110" => bcd_out <= "0110000";
        when "1111" => bcd_out <= "0111000";
        when others => bcd_out <= "1111111";
        end case;
             
    end process;
    


end Behavioral;
