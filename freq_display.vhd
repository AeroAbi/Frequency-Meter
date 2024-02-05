----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2024 16:01:35
-- Design Name: 
-- Module Name: freq_display - Structural
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

entity freq_display is
  Port ( 
        s_in      : in std_logic;
        clk       : in STD_LOGIC;                  -- Clock
        en        : in STD_LOGIC;
        rst       : in std_logic;
        dp        : out std_logic;
		bcd_logic : out std_logic_vector(6 downto 0);
		AN_out    : out std_logic_vector(7 downto 0);
		led_status : out std_logic_vector(2 downto 0)
        

);
end freq_display;

architecture Structural of freq_display is
       signal sec_sig    :  std_logic;
       signal data_in11  :  STD_LOGIC_VECTOR(3 downto 0);  
       signal data_in22  :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_in33  :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_in44  :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_in55  :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_in66  :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_in77  :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_in88  :  STD_LOGIC_VECTOR(3 downto 0);
      
       signal data_out11   :  STD_LOGIC_VECTOR(3 downto 0);  
       signal data_out22   :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_out33   :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_out44   :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_out55   :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_out66   :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_out77   :  STD_LOGIC_VECTOR(3 downto 0);
       signal data_out88   :  STD_LOGIC_VECTOR(3 downto 0);
       
       signal f_data_out11   :  STD_LOGIC_VECTOR(3 downto 0);  
       signal f_data_out22   :  STD_LOGIC_VECTOR(3 downto 0);
       signal f_data_out33   :  STD_LOGIC_VECTOR(3 downto 0);
       signal f_data_out44   :  STD_LOGIC_VECTOR(3 downto 0);
       signal f_data_out55   :  STD_LOGIC_VECTOR(3 downto 0);
       signal f_data_out66   :  STD_LOGIC_VECTOR(3 downto 0);
       signal f_data_out77   :  STD_LOGIC_VECTOR(3 downto 0);
       signal f_data_out88   :  STD_LOGIC_VECTOR(3 downto 0);
       signal dp_vector_sig :  std_logic_vector(7 downto 0);

component frequency_counter is
      Port( 
           s_in    : in std_logic;
           clk     : in std_logic;
           rst     : in std_logic;
           pg      : out std_logic;
           s_delay : out std_logic;
           data1   : out std_logic_vector(3 downto 0);
           data2   : out std_logic_vector(3 downto 0);
           data3   : out std_logic_vector(3 downto 0);
           data4   : out std_logic_vector(3 downto 0);
           data5   : out std_logic_vector(3 downto 0);
           data6   : out std_logic_vector(3 downto 0);
           data7   : out std_logic_vector(3 downto 0);
           data8   : out std_logic_vector(3 downto 0)
           );
        
end component;

component memories is
    Port (
        clk      : in STD_LOGIC;                  -- Clock
        en       : in STD_LOGIC;                  -- Enable write and read operations
        wr       : in STD_LOGIC;                  -- Write signal
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
end component;
component state_ma is
  Port ( 
  clk : in std_logic;
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
        data_out8 : out STD_LOGIC_VECTOR(3 downto 0);
        dp_vector : out STD_LOGIC_VECTOR(7 downto 0);
        led_status : out STD_LOGIC_VECTOR(2 downto 0)
  );
end component;
-------------------------------BCD DISPLAY--------------------------------------
component bcd_display is
  Port ( 
           clk	               : in std_logic;
			reset	           : in std_logic;
			unit_in            : in std_logic_vector(3 downto 0);
            ten_in             : in std_logic_vector(3 downto 0);
            hundred_in         : in std_logic_vector(3 downto 0);
            thousand_in        : in std_logic_vector(3 downto 0);
            ten_thousand_in    : in std_logic_vector(3 downto 0);
            hun_thousand_in    : in std_logic_vector(3 downto 0);
            million_in         : in std_logic_vector(3 downto 0);
            ten_million_in     : in std_logic_vector(3 downto 0);
            dp_vector_in       : in std_logic_vector(7 downto 0);
			dp_bc              : out std_logic;
			bcd_out            : out std_logic_vector(6 downto 0);
			AN_int             : out std_logic_vector(7 downto 0)
            
  );
end component;
-----------------------------------------------------------END COMPONENTS--------------------------------


begin
frequency_counter1:frequency_counter 
port map(
        clk=>clk,
        rst=> rst,
        data1=>data_in11,
        data2=>data_in22,
        data3=>data_in33,
        data4=>data_in44,
        data5=>data_in55,
        data6=>data_in66,
        data7=>data_in77,
        data8=>data_in88,
        s_in=> s_in,
        s_delay=> sec_sig
);

memories1: memories
port map(
clk=>clk,
en=>en,
wr=> sec_sig,
data_in1=>data_in11,
data_in2=>data_in22,
data_in3=>data_in33,
data_in4=>data_in44,
data_in5=>data_in55,
data_in6=>data_in66,
data_in7=>data_in77,
data_in8=>data_in88,

data_out1=>data_out11,
data_out2=>data_out22,  --o/p data_out22 is connected to data_in1 in state_ma
data_out3=>data_out33,
data_out4=>data_out44,
data_out5=>data_out55,
data_out6=>data_out66,
data_out7=>data_out77,
data_out8=>data_out88

);
formating: state_ma
port map(
clk=>clk,
data_in1=>data_out11,
data_in2=>data_out22,
data_in3=>data_out33,
data_in4=>data_out44,
data_in5=>data_out55,
data_in6=>data_out66,
data_in7=>data_out77,
data_in8=>data_out88,

data_out1=>f_data_out11,
data_out2=>f_data_out22,
data_out3=>f_data_out33,
data_out4=>f_data_out44,
data_out5=>f_data_out55,
data_out6=>f_data_out66,
data_out7=>f_data_out77,
data_out8=>f_data_out88,
dp_vector=>dp_vector_sig,
led_status=>led_status

);

final_bcd1: bcd_display 
port map(
clk=>clk,
reset=> rst,
dp_bc =>dp,
dp_vector_in=>dp_vector_sig,
unit_in=>f_data_out11,
ten_in=>f_data_out22,
hundred_in=>f_data_out33,
thousand_in=>f_data_out44,
ten_thousand_in=>f_data_out55,
hun_thousand_in=>f_data_out66,
million_in=>f_data_out77,
ten_million_in=>f_data_out88,
bcd_out=>bcd_logic,
AN_int=> AN_out

);
end Structural;
