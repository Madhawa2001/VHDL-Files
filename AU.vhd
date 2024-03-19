----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2024 05:14:23 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is
    
    component Reg
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               En : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component RCA_4
        Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
    end component;

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;


signal reg0_Q, reg1_Q, temp : std_logic_vector(3 downto 0);
signal En0, En1, carryOutTemp, Clk_slow : std_logic;

begin

Slow_Clk_0 :Slow_Clk
port map(
Clk_in => Clk,
Clk_out => Clk_slow
);

En0 <= RegSel;
En1 <= not RegSel;

Reg_0 : Reg
    port map(
        D => A,
        En => En0,
        Clk => Clk_slow,
        Q => reg0_Q
    );

Reg_1 : Reg
    port map(
        D => A,
        En => En1,
        Clk => Clk_slow,
        Q => reg1_Q
    );

RCA_4_0 : RCA_4
    port map(
    A0 => reg0_Q(0), A1 => reg0_Q(1), A2 => reg0_Q(2), A3 => reg0_Q(3),
    B0 => reg1_Q(0), B1 => reg1_Q(1), B2 => reg1_Q(2), B3 => reg1_Q(3),
    C_in => '0',
    S0 => temp(0), S1 => temp(1), S2 => temp(2), S3 => temp(3),
    c_out => carryOutTemp
    );

--s(0) <= temp(0); s(1) <= temp(1); s(2) <= temp(2); s(3) <= temp(3);
S <= temp;
Carry <= carryOutTemp;
--Zero <= '1' when (temp = "0000" and carryOutTemp = '0') else '0';
Zero <= (not temp(0) and not temp(1) and not temp(2) and not temp(3) and not carryOutTemp);


end Behavioral;
