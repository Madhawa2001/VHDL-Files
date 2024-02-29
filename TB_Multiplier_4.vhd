----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 05:02:03 PM
-- Design Name: 
-- Module Name: TB_Multiplier_4 - Behavioral
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

entity TB_Multiplier_4 is
--  Port ( );
end TB_Multiplier_4;

architecture Behavioral of TB_Multiplier_4 is

component Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

SIGNAL A, B : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL Y : STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

UUT: Multiplier_4 port map(
    A => a,
    B => b,
    Y => y
    );

process 
begin

--Index number is 220011G
--in binary 11 0101 1011 0110 1011
    a(3 downto 0) <= "1011";
    b(3 downto 0) <= "0110";
    
    wait for 50ns;

    a(3 downto 0) <= "0110";
    b(3 downto 0) <= "1011";
    
    wait for 50ns;
    
    a(3 downto 0) <= "1011";
    b(3 downto 0) <= "0101";
    
    wait for 50ns;

    a(3 downto 0) <= "0000";
    b(3 downto 0) <= "0000";
    
    wait for 50ns;
    
    a(3 downto 0) <= "0000";
    b(3 downto 0) <= "1111";
    
    wait for 50ns;
        
    a(3 downto 0) <= "1011";
    b(3 downto 0) <= "0101";
    
    wait for 50ns;
            
    a(3 downto 0) <= "1010";
    b(3 downto 0) <= "1010";
    
    wait for 50ns;
    
    a(3 downto 0) <= "0110";
    b(3 downto 0) <= "0001";
    
    wait for 50ns;
    
    a(3 downto 0) <= "1011";
    b(3 downto 0) <= "0011";
    
    wait for 50ns;
    
    a(3 downto 0) <= "0110";
    b(3 downto 0) <= "1001";
    
    wait for 100ns;
    
    a(3 downto 0) <= "1111";
    b(3 downto 0) <= "1111";
    
    wait;
end process;


end Behavioral;
