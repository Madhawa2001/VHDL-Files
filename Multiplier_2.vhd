----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 02:05:11 PM
-- Design Name: 
-- Module Name: Multiplier_2 - Behavioral
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

entity Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_2;

architecture Behavioral of Multiplier_2 is

component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal b0a0, b1a0, b0a1, b1a1 : std_logic;
signal c1, c2, s1, s2 : std_logic;


begin
    
    FA_0_0 : FA
        PORT MAP(
            A => b1a0,
            B => b0a1,
            C_in => '0',
            s => s1,
            c_out => c1
            );
    FA_1_0 : FA
        PORT MAP(
            A => '0',
            B => b1a1,
            C_in => c1,
            s => s2,
            c_out => c2
            );

    b0a0 <= A(0) AND B(0);
    b1a0 <= A(0) AND B(1);
    b0a1 <= A(1) AND B(0);
    b1a1 <= A(1) AND B(1);
    
    Y(0) <= b0a0;
    Y(1) <= s1;
    Y(2) <= s2;
    Y(3) <= c2;

end Behavioral;
