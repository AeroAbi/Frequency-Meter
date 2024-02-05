----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2024 15:00:06
-- Design Name: 
-- Module Name: Display_delay - Behavioral
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

entity Display_delay is
  Port ( 
  
           clk:std_logic;
           rst:in std_logic;
             
           data1_in   : in std_logic_vector(3 downto 0);
           data2_in  : in std_logic_vector(3 downto 0);
           data3_in   : in std_logic_vector(3 downto 0);
           data4_in   : in std_logic_vector(3 downto 0);
           data5_in   : in std_logic_vector(3 downto 0);
           data6_in   : in std_logic_vector(3 downto 0);
           data7_in   : in std_logic_vector(3 downto 0);
           data8_in   : in std_logic_vector(3 downto 0); 
           
           data1_out   : out std_logic_vector(3 downto 0);
           data2_out   : out std_logic_vector(3 downto 0);
           data3_out   : out std_logic_vector(3 downto 0);
           data4_out   : out std_logic_vector(3 downto 0);
           data5_out   : out std_logic_vector(3 downto 0);
           data6_out   : out std_logic_vector(3 downto 0);
           data7_out   : out std_logic_vector(3 downto 0);
           data8_out   : out std_logic_vector(3 downto 0)); 
  
end Display_delay;

architecture Behavioral of Display_delay is


       signal    data1_inter   :  std_logic_vector(3 downto 0);
       signal    data2_inter  :  std_logic_vector(3 downto 0);
       signal    data3_inter   :  std_logic_vector(3 downto 0);
       signal    data4_inter   : std_logic_vector(3 downto 0);
       signal    data5_inter   :  std_logic_vector(3 downto 0);
       signal    data6_inter   :  std_logic_vector(3 downto 0);
       signal    data7_inter   : std_logic_vector(3 downto 0);
       signal    data8_inter   :  std_logic_vector(3 downto 0); 
       signal count: integer range 0 to 20000000;
      signal bcd_enable:  std_logic;
 begin
process(clk,rst)

begin

    if 	rst='1' then 
        count <= 0;
	elsif rising_edge(clk) then 
	   if count < 100000000 then -- count 1sec
          count <= count + 1;
          data1_inter<= data1_in;
          data2_inter<= data2_in;
          data3_inter<= data3_in;
          data4_inter<= data4_in;
          data5_inter<= data5_in;
          data6_inter<= data6_in;
          data7_inter<= data7_in;
          data8_inter<= data8_in;    
        elsif (count = 100000000) then
          data1_out<= data1_inter;
          data2_out<= data2_inter;
          data3_out<= data3_inter;
          data4_out<= data4_inter;
          data5_out<= data5_inter;
          data6_out<= data6_inter;
          data7_out<= data7_inter;
          data8_out<= data8_inter;
          count <= 0;
         end if;
	  end if;

end process;


end Behavioral;
