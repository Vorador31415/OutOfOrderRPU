----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.08.2019 00:31:50
-- Design Name: 
-- Module Name: tb_registers - Behavioral
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

entity tb_registers is
--  Port ( );
end tb_registers;

architecture Behavioral of tb_registers is

    component registers
    Port ( clk_in : in STD_LOGIC;
           enable_in : in STD_LOGIC;
           read_write : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           adrA_in : in STD_LOGIC_VECTOR (2 downto 0);
           adrB_in : in STD_LOGIC_VECTOR (2 downto 0);
           dataA_out : out STD_LOGIC_VECTOR (15 downto 0);
           dataB_out : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

   signal clk_in : STD_LOGIC := '0';
   signal enable_in : STD_LOGIC := '0';
   signal read_write : STD_LOGIC := '0';
   signal data_in : STD_LOGIC_VECTOR (15 downto 0) := x"0000";
   signal adrA_in : STD_LOGIC_VECTOR (2 downto 0) := x"0";
   signal adrB_in : STD_LOGIC_VECTOR (2 downto 0) := x"0";
   signal dataA_out : STD_LOGIC_VECTOR (15 downto 0) := x"0000";
   signal dataB_out : STD_LOGIC_VECTOR (15 downto 0) := x"0000";
   
   constant clk_period : time := 2ns;

begin

    dut: registers port map(
        clk_in => clk_in,
        enable_in => enable_in,
        read_write => read_write,
        data_in => data_in,
        adrA_in => adrA_in,
        adrB_in => adrB_in,
        dataA_out => dataA_out,
        dataB_out => dataB_out
    );

    clk_process: process
    begin
        clk_in <= not clk_in;
        wait for clk_period;
    end process;

    bench_process : process
    begin
        wait for 1.3*clk_period;
        adrA_in <= x"2";
        data_in <= x"4242";
        wait for clk_period;
        enable_in <= '1';
        wait for clk_period;
        read_write <= '1';
        wait for clk_period;
        data_in <= x"DEAD";
        wait for clk_period;
        enable_in <= '0';
        wait for clk_period;
        read_write <= '0';
        wait for clk_period;
        
        wait for clk_period;
        
        wait for clk_period;
        adrA_in <= x"0";
    end process;

end Behavioral;
