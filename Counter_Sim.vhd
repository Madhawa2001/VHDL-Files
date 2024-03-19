----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 03:43:38 PM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
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


entity Counter_TB is
--  Port ( );
end Counter_TB;

architecture Behavioral of Counter_TB is

    
component Counter
    Port ( 
        Dir : in STD_LOGIC;
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal Dir : STD_LOGIC; 
signal Res : STD_LOGIC; 
signal Clk : STD_LOGIC := '0';
signal Q : STD_LOGIC_VECTOR (2 downto 0);  

begin

UUT: Counter
    port map (
        Dir => Dir,
        Res => Res,
        Clk => Clk,
        Q => Q
    );

process
begin
    
    wait for 5ns;
    Clk <= not Clk;
    
end process;

process
begin

    Dir <= '0';
    Res <= '1';
    wait for 100ns;
    Res <= '0';
    wait for 600ns;
    dir <= '1';
    wait;
    
end process;


end Behavioral;
