----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 02:36:36 PM
-- Design Name: 
-- Module Name: TB_multiplier_2 - Behavioral
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

entity TB_multiplier_2 is
--  Port ( );
end TB_multiplier_2;

architecture Behavioral of TB_multiplier_2 is

component Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL A, B : STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL Y : STD_LOGIC_VECTOR (3 DOWNTO 0);

begin

UUT: Multiplier_2 port map(
    A => a,
    B => b,
    Y => y
    );

process 
begin

    a(1 downto 0) <= "00";
    b(1 downto 0) <= "00";
    
    wait for 50ns;
    
    a(1 downto 0) <= "00";
    b(1 downto 0) <= "01";
    
    wait for 50ns;
        
    a(1 downto 0) <= "00";
    b(1 downto 0) <= "10";
    
    wait for 50ns;
            
    a(1 downto 0) <= "00";
    b(1 downto 0) <= "11";
    
    wait for 50ns;
    
    a(1 downto 0) <= "01";
    b(1 downto 0) <= "00";
    
    wait for 50ns;
    
    a(1 downto 0) <= "01";
    b(1 downto 0) <= "01";
    
    wait for 50ns;
        
    a(1 downto 0) <= "01";
    b(1 downto 0) <= "10";
    
    wait for 50ns;
            
    a(1 downto 0) <= "01";
    b(1 downto 0) <= "11";
    
    wait for 50ns;
    
    a(1 downto 0) <= "10";
    b(1 downto 0) <= "00";
    
    wait for 50ns;
    
    a(1 downto 0) <= "10";
    b(1 downto 0) <= "01";
    
    wait for 50ns;
        
    a(1 downto 0) <= "10";
    b(1 downto 0) <= "10";
    
    wait for 50ns;
            
    a(1 downto 0) <= "10";
    b(1 downto 0) <= "11";
    
    wait for 50ns;
    
    a(1 downto 0) <= "11";
    b(1 downto 0) <= "00";
        
    wait for 50ns;
    
    a(1 downto 0) <= "11";
    b(1 downto 0) <= "01";
    
    wait for 50ns;
        
    a(1 downto 0) <= "11";
    b(1 downto 0) <= "10";
    
    wait for 50ns;
            
    a(1 downto 0) <= "11";
    b(1 downto 0) <= "11";
   
    wait;

end process;

end Behavioral;
