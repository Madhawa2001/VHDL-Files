----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2024 12:38:21 AM
-- Design Name: 
-- Module Name: TB_MUX_8_to_1 - Behavioral
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

entity TB_MUX_8_to_1 is
--  Port ( );
end TB_MUX_8_to_1;

architecture Behavioral of TB_MUX_8_to_1 is

COMPONENT MUX_8_to_1
    Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
END COMPONENT;

SIGNAL S : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL EN,Y : STD_LOGIC;
SIGNAL I : STD_LOGIC_VECTOR (7 downto 0);


begin

UUT: MUX_8_to_1 PORT MAP(
    Y => Y,
    EN => EN,
    I => I,
    S => S );
    
PROCESS
BEGIN
    --Index number = 220011G
    --In binary format = 110 101 101 101 101 011
    EN <= '1';
    I(7 DOWNTO 0) <= "11010101";
    S(2 DOWNTO 0) <= "011";
    
    WAIT FOR 100ns;
    
    EN <= '1';
    I(7 DOWNTO 0) <= "01010101";
    S(2 DOWNTO 0) <= "101";
    
    WAIT FOR 100ns;
  
    EN <= '1';
    I(7 DOWNTO 0) <= "01010101";
    S(2 DOWNTO 0) <= "110";
    
    WAIT FOR 100ns;

    EN <= '1';
    I(7 DOWNTO 0) <= "11111111";
    S(2 DOWNTO 0) <= "100";
    
    WAIT FOR 100ns;
    
    EN <= '0';
    I(7 DOWNTO 0) <= "01010101";
    S(2 DOWNTO 0) <= "100";
    
    WAIT FOR 100ns;
    
    EN <= '1';
    I(7 DOWNTO 0) <= "10000101";
    S(2 DOWNTO 0) <= "111";
    
    WAIT FOR 100ns;
    
    EN <= '0';
    I(7 DOWNTO 0) <= "11110101";
    S(2 DOWNTO 0) <= "110";
    
    WAIT FOR 100ns;
    
    EN <= '1';
    I(7 DOWNTO 0) <= "11010011";
    S(2 DOWNTO 0) <= "000";
    
    WAIT;

END PROCESS;

end Behavioral;
