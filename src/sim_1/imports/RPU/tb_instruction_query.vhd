----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2019 11:36:04
-- Design Name: 
-- Module Name: tb_instruction_query - Behavioral
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
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_instruction_query is
--  Port ( );
end tb_instruction_query;

architecture Behavioral of tb_instruction_query is

    component instruction_query 
        Port ( clk_in : in STD_LOGIC;
               write_in : in STD_LOGIC;
               full_out : out STD_LOGIC;
               empty_out : out STD_LOGIC;
               get_instruction_in : in STD_LOGIC;
               ptr_head_out : out STD_LOGIC_VECTOR (3 downto 0);
               ptr_tail_out : out STD_LOGIC_VECTOR (3 downto 0);
               data_in : in STD_LOGIC_VECTOR (25 downto 0);
               data_out : out STD_LOGIC_VECTOR (25 downto 0));
    end component;

   signal clk_in : STD_LOGIC := '0';
   signal write_in : STD_LOGIC := '0';
   signal full_out : STD_LOGIC := '0';
   signal empty_out : STD_LOGIC := '0';
   signal ptr_head_out : STD_LOGIC_VECTOR (3 downto 0);
   signal ptr_tail_out : STD_LOGIC_VECTOR (3 downto 0);
   signal get_instruction_in : STD_LOGIC := '0';
   signal data_in : STD_LOGIC_VECTOR (25 downto 0) := "00000000000000000000000000";
   signal data_out : STD_LOGIC_VECTOR (25 downto 0) := "00000000000000000000000000";
   
   constant clk_period : time := 4ns;

begin

    dut: instruction_query port map(
        clk_in => clk_in,
        write_in => write_in,
        full_out => full_out,
        ptr_head_out => ptr_head_out,
        ptr_tail_out => ptr_tail_out,
        empty_out => empty_out,
        get_instruction_in => get_instruction_in,
        data_in => data_in,
        data_out => data_out
    );

    clk_process: process
    begin
        clk_in <= not clk_in;
        wait for clk_period;
    end process;

    bench_process : process
    begin
        wait for 1.3*clk_period;
        
        for cycle in 0 to 20 loop
            assert false report "Write in Query" severity note;
            for count1 in 0 to 20-cycle loop 
                get_instruction_in <= '0';
                if full_out = '1' then
                    write_in <= '0';
                    assert false 
                    report "Query is Full";
                else
                    write_in <= '1';
                    data_in <= std_logic_vector(to_unsigned(count1+cycle,26));
                    assert false 
                    report "Input data: " & integer'image(count1) & " Head: " & integer'image(to_integer(unsigned(ptr_head_out))) & " Tail: " & integer'image(to_integer(unsigned(ptr_tail_out))) 
                    severity note;
                end if;
                wait for 2*clk_period;
            end loop;
            assert false report "Read from Query" severity note;
            for count2 in 0 to 20 loop
                write_in <= '0';
                if empty_out = '1' then
                    get_instruction_in <= '0';
                    assert false
                    report "Query is empty! " & " Head: " & integer'image(to_integer(unsigned(ptr_head_out))) & " Tail: " & integer'image(to_integer(unsigned(ptr_tail_out))) 
                    severity note;
                elsif empty_out = '0' then
                    get_instruction_in <= '1';
                    assert false
                    report "Output data: " & integer'image(to_integer(unsigned(data_out))) & " Head: " & integer'image(to_integer(unsigned(ptr_head_out))) & " Tail: " & integer'image(to_integer(unsigned(ptr_tail_out)))
                    severity note;
                end if;
                wait for 2*clk_period;
            end loop;
        end loop;
        
        for count in 0 to 15 loop
            write_in <= '0';
            get_instruction_in <= '0';
            wait for 2*clk_period;
        end loop;
        
        
    end process;
end Behavioral;
