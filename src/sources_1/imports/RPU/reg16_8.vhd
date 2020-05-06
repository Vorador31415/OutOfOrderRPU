----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.08.2019 00:19:22
-- Design Name: 
-- Module Name: registers - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registers is
    Port ( clk_in : in STD_LOGIC;
           enable_in : in STD_LOGIC;
           read_write : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           adrA_in : in STD_LOGIC_VECTOR (2 downto 0);
           adrB_in : in STD_LOGIC_VECTOR (2 downto 0);
           dataA_out : out STD_LOGIC_VECTOR (15 downto 0);
           dataB_out : out STD_LOGIC_VECTOR (15 downto 0));
end registers;

architecture Behavioral of registers is

    type stored_data is array (0 to 7) of std_logic_vector(15 downto 0);
        signal registers : stored_data := (others=>(others=>'0'));
    type stored_rob_ptr is array (0 to 7) of std_logic_vector(2 downto 0);
        signal rob_ptr : stored_rob_ptr := (others=> (others=>'0'));

--	000		RAX 
--	001		RBX
--	010		RCX
--	011		RDX
--	100		REX is the source pointer
--	101		RFX is the destination pointer
--	110		RBP is the programm pointer
--	111		RSP is the segment pointer

begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then
           -- if enable_in='1' then
                if (read_write = '1') then -- read
                    dataA_out <= registers(to_integer(unsigned(adrA_in)));
                    dataB_out <= registers(to_integer(unsigned(adrB_in)));
                elsif (read_write = '0') then -- write
                    registers(to_integer(unsigned(adrA_in))) <= data_in;
                end if;
            -- end if;   
        end if;
    end process;

end Behavioral;