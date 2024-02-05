----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.01.2024 16:22:52
-- Design Name: 
-- Module Name: frequency_counter - Structural
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

entity frequency_counter is
      Port(
           s_in    :in std_logic;
           clk     : in std_logic;
           rst     : in std_logic;
           pg      : out std_logic;
           s_delay: out std_logic;
           data1   : out std_logic_vector(3 downto 0);
           data2   : out std_logic_vector(3 downto 0);
           data3   : out std_logic_vector(3 downto 0);
           data4   : out std_logic_vector(3 downto 0);
           data5   : out std_logic_vector(3 downto 0);
           data6   : out std_logic_vector(3 downto 0);
           data7   : out std_logic_vector(3 downto 0);
           data8   : out std_logic_vector(3 downto 0));
        
end frequency_counter;

architecture Structural of frequency_counter is

signal d_out_signal: std_logic;
signal sec_delay: std_logic;

component rising_edge_detector is
   Port (s_in :in std_logic;
         clk : in std_logic;
         d_out:out std_logic;
         rst: in std_logic);
         
   
end component;

component delay is
    Port ( 
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            sec_delay : out STD_LOGIC;
            mem_wr : out STD_LOGIC);
end component;

component count_8digit is
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
           
end component;


begin

RisingEdge: rising_edge_detector
  port map( s_in=>s_in,
            clk=>clk,
            d_out=>d_out_signal,
            rst=>rst);
 
 Delay1: delay
  port map (
             clk=> clk,
             sec_delay=> sec_delay,
             mem_wr=>s_delay,
             rst=> rst); 
  
  counter8digi: count_8digit 
   port map ( clk=>clk,
              ce=>d_out_signal,
              reset=>rst,
              pg=>pg,
              soft_reset=>sec_delay,
              data1=>data1,
              data2=>data2,
              data3=>data3,
              data4=>data4,
              data5=>data5,
              data6=>data6,
              data7=>data7,
              data8=>data8); 
              
                 
end Structural;
