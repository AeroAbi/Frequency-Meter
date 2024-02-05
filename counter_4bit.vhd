----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.12.2023 08:16:35
-- Design Name: 
-- Module Name: counter_4bit - Behavioral
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
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_4bit is
--  Port ( );
Port (     clk    : in STD_LOGIC;
           ce     : in STD_LOGIC;  -- Count Enable
           reset  : in STD_LOGIC;
           soft_reset  : in STD_LOGIC;  --  Reset
           pg     : out STD_LOGIC; --  pg signal
           cpt_out: out STD_LOGIC_VECTOR(3 downto 0));
end counter_4bit;

architecture Behavioral of counter_4bit is
 signal counter_value : integer  range 0 to 9; -- define integer
 --signal c_reg : std_logic_vector(3 downto 0):="0000";
begin
 process(clk, reset)
    begin
 if reset = '1' then
            counter_value <= 0; -- Reset the counter
        elsif rising_edge(clk) then
        if soft_reset = '1' then
            counter_value <= 0;
            elsif ce = '1' then
            
                 -- Increment the counter when ce is high
                if counter_value = 9 then
                    counter_value <= 0; -- Roll over to 0 when reaching 9
                else  
                 counter_value <= counter_value + 1;
                 end if;
                end if;
            end if;
    end process;
cpt_out <= std_logic_vector(TO_UNSIGNED( counter_value,cpt_out'length))  ;

pg <= '1' when counter_value = 9 and ce='1' else '0';

end Behavioral;

