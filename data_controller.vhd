----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.12.2023 16:00:29
-- Design Name: 
-- Module Name: data_controller - Behavioral
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

entity data_controller is
  Port (
   unit : in std_logic_vector(3 downto 0);
   ten : in std_logic_vector(3 downto 0);
   hundred : in std_logic_vector(3 downto 0);
   thousand : in std_logic_vector(3 downto 0);
   ten_thousand : in std_logic_vector(3 downto 0);
   hun_thousand : in std_logic_vector(3 downto 0);
   million : in std_logic_vector(3 downto 0);
   ten_million : in std_logic_vector(3 downto 0);
   dp_vector : in std_logic_vector(7 downto 0);
   AN: in std_logic_vector(7 downto 0);
   data: out std_logic_vector(3 downto 0);
   dp_init_out: out std_logic
  -- sel_data: in std_logic_vector(2 downto 0)
   
   );
end data_controller;

architecture Behavioral of data_controller is

begin
process(AN,unit, hundred, thousand, ten_thousand, hun_thousand, million, ten_million, dp_vector) 
begin 
        case(AN) is
        when"11111110" => data <= unit;
         dp_init_out <= dp_vector(7);  
        when"11111101" => data <= ten; 
         dp_init_out <= dp_vector(6); 
        when"11111011" => data <= hundred;
          dp_init_out <= dp_vector(5);
        when"11110111" => data <= thousand;
          dp_init_out <= dp_vector(4);
        when"11101111" => data <= ten_thousand;
          dp_init_out <= dp_vector(3);
        when"11011111" => data <= hun_thousand;
        dp_init_out <= dp_vector(2);
        when"10111111" => data <= million;
          dp_init_out <= dp_vector(1);
        when"01111111" => data <= ten_million;
         dp_init_out <= dp_vector(0);
         when others => 
         data <= "0000";
         dp_init_out <= '1';
         
        end case;
        

end process;



end Behavioral;
