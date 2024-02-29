----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 03:33:04 PM
-- Design Name: 
-- Module Name: Multiplier_4 - Behavioral
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

entity Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Multiplier_4;

architecture Behavioral of Multiplier_4 is

component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

SIGNAL b0a0, b0a1, b0a2, b0a3, b1a0, b1a1, b1a2, b1a3, b2a0, b2a1, b2a2, b2a3, b3a0, b3a1, b3a2, b3a3 : STD_LOGIC;
SIGNAL c_0_0, c_0_1, c_0_2, c_1_0, c_1_1, c_1_2, c_2_0, c_2_1, c_2_2, c_3_0, c_3_1, c_3_2: STD_LOGIC;
SIGNAL s_0_0, s_0_1, s_0_2, s_1_0, s_1_1, s_1_2, s_2_0, s_2_1, s_2_2, s_3_0, s_3_1, s_3_2: STD_LOGIC;

begin

FA_0_0 : FA
    PORT MAP(
        A => b1a0,
        B => b0a1,
        C_in => '0',
        s => s_0_0,
        c_out => c_0_0);

FA_0_1 : FA
    PORT MAP(
        A => b1a1,
        B => b0a2,
        C_in => '0',
        s => s_0_1,
        c_out => c_0_1);

FA_0_2 : FA
    PORT MAP(
        A => b1a2,
        B => b0a3,
        C_in => '0',
        s => s_0_2,
        c_out => c_0_2);

FA_1_0 : FA
    PORT MAP(
        A => b2a0,
        B => s_0_1,
        C_in => c_0_0,
        s => s_1_0,
        c_out => c_1_0);

FA_1_1 : FA
    PORT MAP(
        A => b2a1,
        B => s_0_2,
        C_in => c_0_2,
        s => s_1_1,
        c_out => c_1_1);

FA_1_2 : FA
    PORT MAP(
        A => b2a2,
        B => b1a3,
        C_in => c_0_2,
        s => s_1_2,
        c_out => c_1_2);

FA_2_0 : FA
    PORT MAP(
        A => b3a0,
        B => s_1_1,
        C_in => c_1_0,
        s => s_2_0,
        c_out => c_2_0);
        
FA_2_1 : FA
    PORT MAP(
        A => b3a1,
        B => s_1_2,
        C_in => c_1_1,
        s => s_2_1,
        c_out => c_2_1);

FA_2_2 : FA
    PORT MAP(
        A => b3a2,
        B => b2a3,
        C_in => c_1_2,
        s => s_2_2,
        c_out => c_2_2);

FA_3_0 : FA
    PORT MAP(
        A => s_2_1,
        B => '0',
        C_in => c_2_0,
        s => s_3_0,
        c_out => c_3_0);

FA_3_1 : FA
    PORT MAP(
        A => c_2_1,
        B => s_2_2,
        C_in => c_3_0,
        s => s_3_1,
        c_out => c_3_1);        

FA_3_2 : FA
    PORT MAP(
        A => b3a3,
        B => c_2_2,
        C_in => c_3_1,
        s => s_3_2,
        c_out => c_3_2);        
        
        
b0a0 <= A(0) AND B(0);
b0a1 <= A(1) AND B(0);
b0a2 <= A(2) AND B(0);
b0a3 <= A(3) AND B(0);

b1a0 <= A(0) AND B(1);
b1a1 <= A(1) AND B(1);
b1a2 <= A(2) AND B(1);
b1a3 <= A(3) AND B(1);

b2a0 <= A(0) AND B(2);
b2a1 <= A(1) AND B(2);
b2a2 <= A(2) AND B(2);
b2a3 <= A(3) AND B(2);

b3a0 <= A(0) AND B(3);
b3a1 <= A(1) AND B(3);
b3a2 <= A(2) AND B(3);
b3a3 <= A(3) AND B(3);

Y(0) <= b0a0;
Y(1) <= s_0_0;
Y(2) <= s_1_0;
Y(3) <= s_2_0;
Y(4) <= s_3_0;
Y(5) <= s_3_1;
Y(6) <= s_3_2;
y(7) <= c_3_2;

end Behavioral;
