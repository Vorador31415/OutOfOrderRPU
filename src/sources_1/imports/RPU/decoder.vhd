----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.08.2019 00:54:13
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
  Port ( 
    clk_in : in std_logic;
    opcode_in : in std_logic_vector(26 downto 0);
    enable_in : in std_logic;
    register_readwrite_out : in std_logic;
    opcode_length_in : in std_logic_vector(4 downto 0);
    adrA_out : out std_logic_vector(2 downto 0);
    adrB_out : out std_logic_vector(2 downto 0);
    adrMemory_out : out std_logic_vector(15 downto 0);
    dataIMM_out : out std_logic_vector(15 downto 0);
    aluopcode_out : out std_logic_vector(5 downto 0)
  );
end decoder;

architecture Behavioral of decoder is

begin

    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if enable_in = '1' then
            
                case opcode_length_in is
                    when "00110" =>
                        -- opcode(6 bit)
                        aluopcode_out <= opcode_in(26 downto 21);
                        
                        
                    when "01001" =>
                        -- Opcode(6 Bit) Mod(2 Bit) reg(3bit)
                        aluopcode_out <= opcode_in(26 downto 21);
                        adrA_out <= opcode_in(18 downto 16);
                        case opcode_in(20 downto 19) is
                            when "00" =>
                                -- Reg
                                aluopcode_out <= "000001";    
                            when "01" =>
                                -- Adr
                                aluopcode_out <= "000010"; 
                            when "10" =>
                                -- [Adr]
                                aluopcode_out <= "000100"; 
                            when "11" =>
                                -- Imm
                                aluopcode_out <= "001000"; 
                            when others =>
                                aluopcode_out <= "010000"; 
                                -- Exception
                        end case;
                          
                    when "11000" =>
                    -- Opcode(6 Bit) Mod(2 Bit) Adr\Imm(16bit)
                        case opcode_in(20 downto 19) is
                            when "01" =>
                                -- Adr
                                aluopcode_out <= "100000";
                            when "10" =>
                                -- [Adr]
                                aluopcode_out <= "100001";
                            when "11" =>
                                -- Imm
                                aluopcode_out <= "100010";
                            when others =>
                                -- Exception
                                aluopcode_out <= "100100";
                        end case;
                        
                    
                    when "01110" =>
                     -- Opcode(6 Bit) Mod(2 Bit) reg(3bit) reg(3bit)
                     aluopcode_out <= "101000";
                     
                    when "11011" =>
                     -- Opcode(6 Bit) Mod(2 Bit) reg(3bit) Adr\Imm(16bit)
                        case opcode_in(20 downto 19) is
                            when "00" =>
                                -- Reg 
                                aluopcode_out <= "110000";
                            when "01" =>
                                -- Reg & Adr
                                aluopcode_out <= "110001";
                            when "10" =>
                                -- Reg & [Adr]
                                aluopcode_out <= "110010";
                            when "11" =>
                                -- Reg & Imm
                                aluopcode_out <= "110100";
                            when others =>
                                -- Exception
                                aluopcode_out <= "111000";
                        end case;
                    when others =>
                     -- Exception
                end case;
                
            end if;
        end if;
    end process;

end Behavioral;
