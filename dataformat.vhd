----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.01.2024 11:28:18
-- Design Name: 
-- Module Name: dataformat - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_signed.all;

entity FrequencyDisplay is
    Port (
        clk : in STD_LOGIC;               -- Clock input
        reset : in STD_LOGIC;             -- Reset input
        --frequency_input : in STD_LOGIC_VECTOR(31 downto 0); -- Input frequency in BCD format
        bcd_logic: in STD_LOGIC_VECTOR(31 downto 0);
        unit_change : out STD_LOGIC_VECTOR(2 downto 0);    -- Output unit: 00 - Hz, 01 - kHz, 10 - MHz
        display_output : out STD_LOGIC_VECTOR(31 downto 0)  -- 8-digit BCD display output
        --unit_output: out STD_LOGIC_VECTOR(1 downto 0)  --display the status of unit change
    );
end FrequencyDisplay;

architecture Behavioral of FrequencyDisplay is
    signal bcd_logic_internal : STD_LOGIC_VECTOR(31 downto 0);  -- Internal signal for frequency processing
    signal unit_internal : STD_LOGIC_VECTOR(1 downto 0);        -- Internal signal for unit processing 

    -- Constants for unit conversion
    constant kHz_threshold : integer := 1000;    --giving a threshold to define the state
    constant MHz_threshold : integer := 1000000;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            bcd_logic_internal <= "0";  --need to change according to o/p frm memory
            unit_internal <= "00";  -- Default unit -Hz
            unit_change <=unit_internal;  --moves the value from internal to o/p unit change
        elsif rising_edge(clk) then
            -- Update internal frequency value
            bcd_logic_internal <= bcd_logic;  --moves the o/p frm memory to internal signal

            -- change unit
            if bcd_logic_internal >=  MHz_threshold then
                unit_internal <= "10";  -- Set unit to MHz
                unit_change <=unit_internal;
                bcd_logic_internal <= bcd_logic_internal / MHz_threshold;
            elsif bcd_logic(bcd_logic_internal) >= kHz_threshold then
                unit_internal <= "01";  -- Set unit to kHz
                unit_change <=unit_internal;
                bcd_logic_internal <= bcd_logic_internal / kHz_threshold;  --vector/integer

            else
                unit_internal <= "00";  -- Set unit to Hz
                unit_change <=unit_internal;
            end if;
        end if;
    end process;

    -- Output formatting for display--we can embedd this in process too
    display_output <= bcd_logic_internal when rising_edge(clk) 
	        else (others => '0');
    --unit_output <= unit_internal when rising_edge(clk)   --maybe not required!!
	        --else (others => '0');
end Behavioral;



