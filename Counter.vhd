----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2024 02:50:53 AM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end Counter;

architecture Behavioral of Counter is

Component D_FF is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal D0, D1, D2 : std_logic;
signal Q0, Q1, Q2 : std_logic;
signal Clk_slow : std_logic;

begin

Slow_clk0 : Slow_clk
    port map(
        Clk_in => Clk,
        Clk_out => Clk_slow);

D0 <= ((not Q2) and (not Dir)) or (Q1 and Dir);
D1 <= ( Q0 and (not Dir)) or (Q2 and Dir);
D2 <= ((not Q0) and Dir) or (Q1 and (not Dir));

D_FF0 : D_FF
    port map(
        D => D0,
        Res => Res,
        Clk => Clk_slow,
        Q => Q0);

D_FF1 : D_FF
    port map(
        D => D1,
        Res => Res,
        Clk => Clk_slow,
        Q => Q1);

D_FF2 : D_FF
    port map(
        D => D2,
        Res => Res,
        Clk => Clk_slow,
        Q => Q2);

Q(0) <= Q0;
Q(1) <= Q1;
Q(2) <= Q2;

end Behavioral;