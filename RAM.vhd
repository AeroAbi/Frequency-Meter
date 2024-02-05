----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/10/2024 08:06:10 PM
-- Design Name: 
-- Module Name: RAM - Behavioral
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
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory is
    generic (
        n : natural := 4;   -- Data bus width (default: 8 bits)
        d : natural := 5   -- Address bus width (default: 10 bits)
    );
    Port (
        clk      : in STD_LOGIC;                  -- Clock
        en       : in STD_LOGIC;                  -- Enable write and read operations
        wr       : in STD_LOGIC;                  -- Write signal
        addr     : in STD_LOGIC_VECTOR(d-1 downto 0);  -- Address bus
        data_in  : in STD_LOGIC_VECTOR(n-1 downto 0);  -- Input data bus
        data_out : out STD_LOGIC_VECTOR(n-1 downto 0)  -- Output data bus
    );
end Memory;



architecture Behavioral of Memory is
type MemoryArray is array (0 to 2**d - 1) of STD_LOGIC_VECTOR(n-1 downto 0);
    signal memo : MemoryArray := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                if wr = '1' then
                    memo(TO_INTEGER(unsigned(addr))) <= data_in;
                else
                    data_out <= memo(to_integer(unsigned(addr)));
                end if;
            end if;
        end if;
    end process;
end Behavioral;
