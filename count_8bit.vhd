----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2024 10:33:24
-- Design Name: 
-- Module Name: count_8bit - Structural
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

entity count_8digit is
  Port (   clk     : in std_logic;
           ce      : in std_logic;
           reset   : in std_logic;
           soft_reset   : in std_logic;
           pg      : out std_logic;
           data1   : out std_logic_vector(3 downto 0);
           data2   : out std_logic_vector(3 downto 0);
           data3   : out std_logic_vector(3 downto 0);
           data4   : out std_logic_vector(3 downto 0);
           data5   : out std_logic_vector(3 downto 0);
           data6   : out std_logic_vector(3 downto 0);
           data7   : out std_logic_vector(3 downto 0);
           data8   : out std_logic_vector(3 downto 0)); 
           
end count_8digit; -- we added the inputs and outputs of the counter/ in other words we initialized the counter


architecture structural of count_8digit is


signal pg_1: std_logic;
signal pg_2: std_logic;
signal pg_3: std_logic;
signal pg_4: std_logic;
signal pg_5: std_logic;
signal pg_6: std_logic;
signal pg_7: std_logic;
signal C_out1: std_logic_vector(3 downto 0);
signal C_out2: std_logic_vector(3 downto 0);
signal C_out3: std_logic_vector(3 downto 0);
signal C_out4: std_logic_vector(3 downto 0);
signal C_out5: std_logic_vector(3 downto 0);
signal C_out6: std_logic_vector(3 downto 0);
signal C_out7: std_logic_vector(3 downto 0);
signal C_out8: std_logic_vector(3 downto 0);

Component counter_4bit is
  Port (   clk     : in std_logic;
           ce      : in std_logic;
           reset   : in std_logic;
           soft_reset   : in std_logic;
           pg      : out std_logic;
           cpt_out   : out std_logic_vector(3 downto 0)); 
           
end component; -- we added the inputs and outputs of the counter/ in other words we initialized the counter

begin
data1<= C_out1;
data2<= C_out2;
data3<= C_out3;
data4<= C_out4;
data5<= C_out5;
data6<= C_out6;
data7<= C_out7;
data8<= C_out8;


counter1: counter_4bit 
port map(  clk=>clk,
           ce=>ce,
           reset=>reset,
           pg=>pg_1,
            cpt_out=>C_out1,
            soft_reset => soft_reset
            );

counter2: counter_4bit 
port map(  clk=>clk,
           ce=>pg_1,
           reset=>reset,
           pg=>pg_2,
           cpt_out=>C_out2,
           soft_reset => soft_reset
           );
          
counter3: counter_4bit 
port map(  clk=>clk,
           ce=>pg_2,
           reset=>reset,
           pg=>pg_3,
           cpt_out=>C_out3,
           soft_reset => soft_reset
           );

counter4: counter_4bit 
port map(  clk=>clk,
           ce=>pg_3,
           reset=>reset,
           pg=>pg_4,
           cpt_out=>C_out4,
           soft_reset => soft_reset
           );

counter5: counter_4bit 
port map(  clk=>clk,
           ce=>pg_4,
           reset=>reset,
           pg=>pg_5,
           cpt_out=>C_out5,
           soft_reset => soft_reset
           );

counter6: counter_4bit 
port map(  clk=>clk,
           ce=>pg_5,
           reset=>reset,
           pg=>pg_6,
           cpt_out=>C_out6,
           soft_reset => soft_reset
           );           
           
counter7: counter_4bit 
port map(  clk=>clk,
           ce=>pg_6,
           reset=>reset,
           pg=>pg_7,
           cpt_out=>C_out7,
           soft_reset => soft_reset
           );           
           
counter8: counter_4bit 
port map(  clk=>clk,
           ce=>pg_7,
           reset=>reset,
           pg=>Pg,
           cpt_out=>C_out8,
           soft_reset => soft_reset
           ); 

end Structural;


         
           

 
         
           
