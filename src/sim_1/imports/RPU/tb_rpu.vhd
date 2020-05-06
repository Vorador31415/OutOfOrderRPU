----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2019 06:22:10
-- Design Name: 
-- Module Name: tb_rpu - Behavioral
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

entity tb_rpu is
--  Port ( );
end tb_rpu;

architecture Behavioral of tb_rpu is

    component top
    Port ( 
        clk_in : in STD_LOGIC;
        -- versuche mal eine dynamische Clock, vielleicht eine Langsame, so 1 MHz und eine schnelle, so 400 MHz
        clk_timer : in STD_LOGIC;
        write_in : in STD_LOGIC;
        data_in : in std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0);
        Adr_out : out std_logic_vector(15 downto 0)
        
--        ;instruction_to_RS : out std_logic_vector(6 downto 0)
    
    );
    end component;
    
   signal clk_in : STD_LOGIC := '0';
   signal clk_timer : STD_LOGIC := '0';
   signal write_in : STD_LOGIC := '0';

   signal data_in : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');
   signal data_out : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');
   signal adr_out : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');
--   signal instruction_to_rs : STD_LOGIC_VECTOR (6 downto 0) := (others=>'0');
   
   constant clk_period : time := 4ns;
   constant clk_timer_period : time := 3ns;

begin

    duu: top port map (
        clk_in => clk_in,
        clk_timer=>clk_timer,
        write_in=>write_in,
        data_in=>data_in,
        data_out=>data_out
--       , instruction_to_rs=> instruction_to_rs
    );
    
    clk_process:process
    begin
        clk_in <= not clk_in;
        wait for clk_period;
    end process;
    
    clk_timer_process: process
    begin
        clk_timer <= not clk_timer;
        wait for clk_timer_period;
    end process;

end Behavioral;
