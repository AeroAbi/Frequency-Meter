----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 12:33:38 AM
-- Design Name: 
-- Module Name: bcd_display - Behavioral
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

entity bcd_display is
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
end bcd_display;

architecture Structural of bcd_display is

-----------------signals-------------------

signal clk_out_int          : std_logic;
signal an_out_int           : std_logic_vector(7 downto 0);
signal dp_out_int           : std_logic;
signal dp_out_final         : std_logic;
signal dp_vector_int        : std_logic_vector(7 downto 0);
signal unit_init            : std_logic_vector(3 downto 0);
signal ten_init             : std_logic_vector(3 downto 0);
signal hundred_init         : std_logic_vector(3 downto 0);
signal thousand_init        : std_logic_vector(3 downto 0);
signal ten_thousand_init    : std_logic_vector(3 downto 0);
signal hun_thousand_init    : std_logic_vector(3 downto 0);
signal million_init         : std_logic_vector(3 downto 0);
signal ten_million_init     : std_logic_vector(3 downto 0);
signal data_int             : std_logic_vector(3 downto 0);
signal bcd_logic_init       : std_logic_vector(6 downto 0); 

-------------------------------------- an generator -----------------------------------
component an_generater is 
	Port ( 	clk		: in std_logic;
			reset	: in std_logic;
			An_out_f    :out std_logic_vector(7 downto 0)
			);

end component;
---------------------------------------------------------------------------------------------

------------data controller component --------------------
  
  component data_controller is
  Port (
   unit         : in std_logic_vector(3 downto 0);
   ten          : in std_logic_vector(3 downto 0);
   hundred      : in std_logic_vector(3 downto 0);
   thousand     : in std_logic_vector(3 downto 0);
   ten_thousand : in std_logic_vector(3 downto 0);
   hun_thousand : in std_logic_vector(3 downto 0);
   million      : in std_logic_vector(3 downto 0);
   ten_million  : in std_logic_vector(3 downto 0);
   dp_vector    : in std_logic_vector(7 downto 0);
   AN           : in std_logic_vector(7 downto 0);
   data         : out std_logic_vector(3 downto 0);
   dp_init_out  : out std_logic
   );

end component;
--------------------BCD LOGIC---------------------
component  bcd_logic is
  Port (
   data : in std_logic_vector(3 downto 0);
   dp_init: in std_logic;
   bcd_out: out std_logic_vector(6 downto 0);
   dp_lo: out std_logic
   );
end component;

------------------------end components-------------------

begin

bcd_out <= bcd_logic_init;
unit_init           <=  unit_in;
ten_init            <=  ten_in;   
hundred_init        <=  hundred_in;
thousand_init       <=  thousand_in;
ten_thousand_init   <=  ten_thousand_in;
hun_thousand_init   <=  hun_thousand_in;
million_init        <=  million_in;
ten_million_init    <=  ten_million_in;
bcd_out             <= bcd_logic_init;
AN_int              <= an_out_int;
dp_bc               <= dp_out_final;
dp_vector_int       <= dp_vector_in;

--------------------------------an generator---------------------------------
an_gen: an_generater 
port map(
    clk => clk,
    reset => reset,
    An_out_f => an_out_int
);
---------------------------data controller--------------------------

data_controller1: data_controller
port map(
unit            => unit_init,
ten             => ten_init,
hundred         => hundred_init,
thousand        => thousand_init,
ten_thousand    => ten_thousand_init,
hun_thousand    => hun_thousand_init,
million         => million_init,
ten_million     => ten_million_init,
dp_vector       => dp_vector_int,
AN              => an_out_int,
dp_init_out     => dp_out_int, 
data            => data_int
);

-------------------------------bcd logic-----------------------------------

bcd_logic1: bcd_logic 
port map (
    data => data_int,
    dp_init=> dp_out_int,
    dp_lo => dp_out_final,
    bcd_out =>bcd_logic_init 

);

-------------------------------------------------------------------------------


end Structural;
