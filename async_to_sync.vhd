----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2024 09:33:04
-- Design Name: 
-- Module Name: rising_edge_detector - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rising_edge_detector is
   Port (
         s_in :in std_logic;
         clk : in std_logic;
         d_out:out std_logic;
         rst: in std_logic);
         
   
end rising_edge_detector;

architecture Behavioral of rising_edge_detector is

signal q1: std_logic;
signal q2: std_logic;
signal reset: std_logic;

begin
process(rst,clk)
begin

        
if(rst='1') then
    q1<= '0';
    q2<= '0';
    elsif(rising_edge(clk))then
            q1 <= s_in;
            q2<= q1;
 end if;

  
end process;
     
d_out <= not(q2) and q1 ;
end Behavioral;
