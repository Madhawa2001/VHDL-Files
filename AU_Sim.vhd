----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2024 12:34:58 PM
-- Design Name: 
-- Module Name: AU_Sim - Behavioral
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

entity AU_Sim is
--  Port ( );
end AU_Sim;

architecture Behavioral of AU_Sim is

component AU
        Port ( 
            A : in STD_LOGIC_VECTOR (3 downto 0);
            RegSel : in STD_LOGIC;
            Clk : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR (3 downto 0);
            Zero : out STD_LOGIC;
            Carry : out STD_LOGIC
        );
end component;

signal A : std_logic_vector(3 downto 0);
signal RegSel : std_logic;
signal Clk : std_logic := '0';
signal S : std_logic_vector(3 downto 0);
signal Zero : std_logic;
signal Carry : std_logic;

begin

UUT: AU port map (
        A => A,
        RegSel => RegSel,
        Clk => Clk,
        S => S,
        Zero => Zero,
        Carry => Carry
    );

clk_process: process
begin
while now < 1000 ns loop
            Clk <= '0';
            wait for 5 ns;
            Clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
end process;

process
 begin
 
        --A <= (others => '0');
        --RegSel <= '0';
        
        --Index Number = 220011G
        --220011 in binary = 11 0101 1011 0110 1011
        A <= "0000";
        RegSel <= '0';

        wait for 100 ns;

        A <= "1011";
        RegSel <= '1';
        wait for 100 ns;

        A <= "0110";
        RegSel <= '0';
        wait for 100 ns;
        
        A <= "0101";
        RegSel <= '1';
        wait for 100 ns;
        
        A <= "1111";
        RegSel <= '0';
        wait for 100 ns;
        
        A <= "0111";
        RegSel <= '1';
        wait for 100 ns;
        
        A <= "0100";
        RegSel <= '1';
        wait for 100 ns;
        
        A <= "1001";
        RegSel <= '0';
        wait for 100 ns;
        
        A <= "1101";
        RegSel <= '1';
        wait for 100 ns;
                
        A <= "0111";
        RegSel <= '0';
        wait for 100 ns;        
        wait;
end process;

end Behavioral;
