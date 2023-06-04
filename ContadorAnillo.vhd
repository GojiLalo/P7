----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 14:32:30
-- Design Name: 
-- Module Name: contAnillo - Behavioral
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
use ieee.std_logic_unsigned.ALL;
use IEEE.std_logic_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contAnillo is

Port ( clk: in std_logic;
        clr: in std_logic;
        anodoA: inout BIT_VECTOR (2 downto 0) := "011");
end contAnillo;

architecture Behavioral of contAnillo is
begin
mensaje: process(clk)
    begin
        if (clr = '1') then
            anodoA <= "011";
        elsif (clk'event and clk = '1') then
            anodoA <= anodoA ror 1;
        end if;
    end process mensaje; 
end Behavioral;
