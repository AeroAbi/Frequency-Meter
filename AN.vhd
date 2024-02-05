library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AN_generater is 
	Port ( 	clk		: in std_logic;
			reset	: in std_logic;
			An_out_f  :out std_logic_vector(7 downto 0)
			);

end AN_generater;

architecture behavioral of AN_generater is
signal clk_out_int   : std_logic;
signal an_out_init   : std_logic_vector(7 downto 0);



-----------------------------------------------AN GENERATOR----------------------------------------

---------------clk divider component-----------------
component clk_divider is
  Port (
        clk     : in std_logic;
        rst     : in std_logic;
        clk_out : out std_logic     
   );
   end component;
   ------------an counter component---------------
   component AN_counter is
  Port (
         clk    : in std_logic;
         clk_1kh: in std_logic;
         reset  : in std_logic;
         AN_out : out std_logic_vector(7 downto 0)
  );
  end component;
 
begin 
    An_out_f <= AN_out_init;
    ---------------------------------------clk divider map ----------------------------------
	clk_divider1: clk_divider
	port map(
	       rst => reset,
	       clk => clk,
	       clk_out => clk_out_int                
	);
	
	--------------------------------------an counter port map-----------------------------------------
	
	an_counter1 : AN_counter
	port map (
	   clk => clk,
	   reset => reset,
	   clk_1kh =>  clk_out_int,
	   AN_out => AN_out_init
	);
			
end behavioral;