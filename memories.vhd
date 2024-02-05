----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2024 16:29:49
-- Design Name: 
-- Module Name: memories - Structural
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

entity memories is
 
    Port (
        clk      : in STD_LOGIC;                  -- Clock
        en       : in STD_LOGIC;                  -- Enable write and read operations
        wr       : in STD_LOGIC;
                          
       -- addr1     : in STD_LOGIC_VECTOR(d-1 downto 0);
        --addr2     : in STD_LOGIC_VECTOR(d-1 downto 0);
        --addr3     : in STD_LOGIC_VECTOR(d-1 downto 0);
        --addr4     : in STD_LOGIC_VECTOR(d-1 downto 0);
        --addr5     : in STD_LOGIC_VECTOR(d-1 downto 0);
        --addr6     : in STD_LOGIC_VECTOR(d-1 downto 0);
        --addr7     : in STD_LOGIC_VECTOR(d-1 downto 0);
        --addr8     : in STD_LOGIC_VECTOR(d-1 downto 0);
     
        data_in1  : in STD_LOGIC_VECTOR(3 downto 0);  -- Input data bus
        data_in2  : in STD_LOGIC_VECTOR(3 downto 0);
        data_in3  : in STD_LOGIC_VECTOR(3 downto 0);
        data_in4  : in STD_LOGIC_VECTOR(3 downto 0);
        data_in5  : in STD_LOGIC_VECTOR(3 downto 0);
        data_in6  : in STD_LOGIC_VECTOR(3 downto 0);
        data_in7  : in STD_LOGIC_VECTOR(3 downto 0);
        data_in8  : in STD_LOGIC_VECTOR(3 downto 0);
        
        data_out1 : out STD_LOGIC_VECTOR(3 downto 0);  -- Output data bus
        data_out2 : out STD_LOGIC_VECTOR(3 downto 0);
        data_out3 : out STD_LOGIC_VECTOR(3 downto 0);
        data_out4 : out STD_LOGIC_VECTOR(3 downto 0);
        data_out5 : out STD_LOGIC_VECTOR(3 downto 0);
        data_out6 : out STD_LOGIC_VECTOR(3 downto 0);
        data_out7 : out STD_LOGIC_VECTOR(3 downto 0);
        data_out8 : out STD_LOGIC_VECTOR(3 downto 0)
 
 );
end memories;

architecture Structural of memories is
      
       signal addr_sig1     :  STD_LOGIC_VECTOR(4 downto 0);  -- Address bus
       signal addr_sig2     :  STD_LOGIC_VECTOR(4 downto 0);
       signal addr_sig3     :  STD_LOGIC_VECTOR(4 downto 0);
       signal addr_sig4     :  STD_LOGIC_VECTOR(4 downto 0);
       signal addr_sig5     :  STD_LOGIC_VECTOR(4 downto 0);
       signal addr_sig6     :  STD_LOGIC_VECTOR(4 downto 0);
       signal addr_sig7     :  STD_LOGIC_VECTOR(4 downto 0);
       signal addr_sig8     :  STD_LOGIC_VECTOR(4 downto 0);

component Memory is
    generic (
        n : natural := 4;   -- Data bus width (default: 8 bits)
        d : natural := 5   -- Address bus width (default: 10 bits)
    );
    Port (
        clk      : in STD_LOGIC;                  -- Clock
        en       : in STD_LOGIC;                  -- Enable write and read operations
        wr       : in STD_LOGIC;                  -- Write signal
        addr     : in STD_LOGIC_VECTOR(4 downto 0);  -- Address bus
        data_in  : in STD_LOGIC_VECTOR(3 downto 0);  -- Input data bus
        data_out : out STD_LOGIC_VECTOR(3 downto 0)  -- Output data bus
    );
end component;
begin
addr_sig1<="00001";
addr_sig2<="00010";
addr_sig3<="00100";
addr_sig4<="00110";
addr_sig5<="10000";
addr_sig6<="01001";
addr_sig7<="10011";
addr_sig8<="01001";

ram_unit: Memory 
port map (
clk=>clk,
en=>en,
wr=>wr,
addr=>addr_sig1,
data_in=>data_in1,
data_out => data_out1
);
ram_ten: Memory 
port map (
clk=>clk,
en=>en,
wr=>wr,
addr=>addr_sig2,
data_in=>data_in2,
data_out => data_out2
);
ram_hundred: Memory 
port map (
clk=>clk,
en=>en,
wr=>wr,
addr=>addr_sig3,
data_in=>data_in3,
data_out => data_out3
);
ram_thou: Memory 
port map (
clk=>clk,
en=>en,
wr=>wr,
addr=>addr_sig4,
data_in=>data_in4,
data_out => data_out4
);
ram_tenthou: Memory 
port map (
clk=>clk,
en=>en,
wr=>wr,
addr=>addr_sig5,
data_in=>data_in5,
data_out => data_out5
);
ram_hunthou: Memory 
port map (
clk=>clk,
en=>en,
wr=>wr,
addr=>addr_sig6,
data_in=>data_in6,
data_out => data_out6
);
ram_mil: Memory 
port map (
clk=>clk,
en=>en,
wr=>wr,
addr=>addr_sig7,
data_in=>data_in7,
data_out => data_out7
);
ram_tenmil: Memory 
port map (
clk=>clk,
en=>en,
wr=>wr,
addr=>addr_sig8,
data_in=>data_in8,
data_out => data_out8

);



end Structural;
