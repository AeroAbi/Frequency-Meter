----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2023 14:43:55
-- Design Name: 
-- Module Name: state_ma - Behavioral
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

entity state_ma is
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
end state_ma;

architecture Behavioral of state_ma is

type state is (hz,khz,tkhz,hkhz,mhz,tmhz);
signal n_state,p_state: state;
begin
block_m : process(clk)
            begin 
                if rising_edge(clk) then p_state<= n_state;
                else
                p_state <= p_state;
end if;

end process;

-- block g is for the output of the present state begin

--door_status <= '1' when p_state = ouvert else '0'; 
-- or we can use process if the output is complex
block_g: process(p_state)
        begin 
            case (p_state) is 
             when hz=>
              data_out1<= data_in1;
              data_out2<= data_in2;
              data_out3<= data_in3;
              data_out4<= data_in4;
              data_out5<= "0000";
              data_out6<= "0000";
              data_out7<= "0000";
              data_out8<= "0000";
              dp_vector<= "00000000";
              led_status<= "001";
               
        when khz=>
              data_out1<= data_in1;
              data_out2<= data_in2;
              data_out3<= data_in3;
              data_out4<= data_in4;
              data_out5<= "0000";
              data_out6<= "0000";
              data_out7<= "0000";
              data_out8<= "0000";
              dp_vector<= "00010000";
              led_status<= "010";
        when tkhz=>
              data_out1<= data_in2;
              data_out2<= data_in3;
              data_out3<= data_in4;
              data_out4<= data_in5;
              data_out5<= "0000";
              data_out6<= "0000";
              data_out7<= "0000";
              data_out8<= "0000";
              dp_vector<= "00100000";
              led_status<= "010";
              
         when hkhz=>
              data_out1<= data_in3;
              data_out2<= data_in4;
              data_out3<= data_in5;
              data_out4<= data_in6;
              data_out5<= "0000";
              data_out6<= "0000";
              data_out7<= "0000";
              data_out8<= "0000";
              dp_vector<= "01000000";
              led_status<= "010";
               when mhz=>
              data_out1<= data_in4;
              data_out2<= data_in5;
              data_out3<= data_in6;
              data_out4<= data_in7;
              data_out5<= "0000";
              data_out6<= "0000";
              data_out7<= "0000";
              data_out8<= "0000";
              dp_vector<= "00010000";
              led_status<= "100";
         when tmhz=>
              data_out1<= data_in5;
              data_out2<= data_in6;
              data_out3<= data_in7;
              data_out4<= data_in8;
              data_out5<= "0000";
              data_out6<= "0000";
              data_out7<= "0000";
              data_out8<= "0000";
              dp_vector<= "00010000";
              led_status<= "100";
           when others =>
             data_out1<= data_in1;
              data_out2<= data_in2;
              data_out3<= data_in3;
              data_out4<= data_in4;
              data_out5<=data_in5 ;
              data_out6<= data_in6;
              data_out7<= data_in7;
              data_out8<= data_in8;
              dp_vector<= "00000000";
              led_status<= "000";
             end case;
             end process;


block_f: process(data_in1,data_in2,data_in3,data_in4,data_in5,data_in6,data_in7,data_in8, p_state)
        begin 
            case (p_state) is
            when hz => if(data_in4 ="0000" and data_in5 ="0000" and  data_in6 ="0000" and  data_in7 ="0000" and data_in8 ="0000") then n_state<= hz;
   
                            elsif(data_in8 /="0000") then n_state<= tmhz;
                            elsif(data_in7 /="0000") then n_state<= mhz;
                             elsif(data_in6 /="0000") then n_state<= hkhz;
                              elsif(data_in5 /="0000") then n_state<= tkhz;
                              elsif(data_in4 /="0000") then n_state<= khz;
                             end if;
             when khz =>if(data_in4 ="0000" and data_in5 ="0000" and  data_in6 ="0000" and  data_in7 ="0000" and data_in8 ="0000") then n_state<= hz;
   
                            elsif(data_in8 /="0000") then n_state<= tmhz;
                            elsif(data_in7 /="0000") then n_state<= mhz;
                             elsif(data_in6 /="0000") then n_state<= hkhz;
                              elsif(data_in5 /="0000") then n_state<= tkhz;
                              elsif(data_in4 /="0000") then n_state<= khz;
                             end if;
             when tkhz => if(data_in4 ="0000" and data_in5 ="0000" and  data_in6 ="0000" and  data_in7 ="0000" and data_in8 ="0000") then n_state<= hz;
   
                            elsif(data_in8 /="0000") then n_state<= tmhz;
                            elsif(data_in7 /="0000") then n_state<= mhz;
                             elsif(data_in6 /="0000") then n_state<= hkhz;
                              elsif(data_in5 /="0000") then n_state<= tkhz;
                              elsif(data_in4 /="0000") then n_state<= khz;
                             end if;
             when hkhz =>if(data_in4 ="0000" and data_in5 ="0000" and  data_in6 ="0000" and  data_in7 ="0000" and data_in8 ="0000") then n_state<= hz;
   
                            elsif(data_in8 /="0000") then n_state<= tmhz;
                            elsif(data_in7 /="0000") then n_state<= mhz;
                             elsif(data_in6 /="0000") then n_state<= hkhz;
                              elsif(data_in5 /="0000") then n_state<= tkhz;
                              elsif(data_in4 /="0000") then n_state<= khz;
                             end if;
            when mhz =>if(data_in4 ="0000" and data_in5 ="0000" and  data_in6 ="0000" and  data_in7 ="0000" and data_in8 ="0000") then n_state<= hz;
   
                            elsif(data_in8 /="0000") then n_state<= tmhz;
                            elsif(data_in7 /="0000") then n_state<= mhz;
                             elsif(data_in6 /="0000") then n_state<= hkhz;
                              elsif(data_in5 /="0000") then n_state<= tkhz;
                              elsif(data_in4 /="0000") then n_state<= khz;
                             end if;
            when tmhz =>if(data_in4 ="0000" and data_in5 ="0000" and  data_in6 ="0000" and  data_in7 ="0000" and data_in8 ="0000") then n_state<= hz;
   
                            elsif(data_in8 /="0000") then n_state<= tmhz;
                            elsif(data_in7 /="0000") then n_state<= mhz;
                             elsif(data_in6 /="0000") then n_state<= hkhz;
                              elsif(data_in5 /="0000") then n_state<= tkhz;
                              elsif(data_in4 /="0000") then n_state<= khz;
                             end if;
            when others=> n_state<= hz;
            end case;
    end process;                
end Behavioral;
