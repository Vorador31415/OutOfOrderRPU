library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
--use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_query is
    Port ( clk_in : in STD_LOGIC;
           write_in : in STD_LOGIC;
           full_out : out STD_LOGIC;
           empty_out : out STD_LOGIC;
           get_instruction_in : in STD_LOGIC;
           ptr_head_out : out STD_LOGIC_VECTOR (3 downto 0);
           ptr_tail_out : out STD_LOGIC_VECTOR (3 downto 0);
           data_in : in STD_LOGIC_VECTOR (25 downto 0);
           data_out : out STD_LOGIC_VECTOR (25 downto 0));
end instruction_query;

architecture Behavioral of instruction_query is

    signal bool_full : std_logic:='0';
    signal bool_empty : std_logic:='1';

    signal ptr_head : std_logic_vector(3 downto 0) := (others=>'0');
    signal ptr_tail : std_logic_vector(3 downto 0) := (others=>'0');
    type stored_instructions is array (0 to 15) of std_logic_vector(25 downto 0);
        signal instructions : stored_instructions := (others=>(others=>'0'));
 
begin

    ptr_head_out <= ptr_head;
    ptr_tail_out <= ptr_tail;

    process (clk_in)
    begin
        if rising_edge(clk_in) then
            if (write_in = '1' and bool_full = '0') then
                instructions(to_integer(unsigned(ptr_tail))) <= data_in;
                ptr_tail <= ptr_tail + "0001";
            end if;
            if (get_instruction_in = '1' and bool_empty = '0') then
                data_out <= instructions(to_integer(unsigned(ptr_head)));
                ptr_head <= ptr_head + "0001";
            end if; 
        end if;
    end process;
    
    full_out <= '1' when unsigned(ptr_tail+1) = unsigned(ptr_head) else '0';
    bool_full <= '1' when unsigned(ptr_tail+1) = unsigned(ptr_head) else '0';
    
    empty_out <= '1' when unsigned(ptr_tail) = unsigned(ptr_head) else '0';
    bool_empty <= '1' when unsigned(ptr_tail) = unsigned(ptr_head) else '0';

end Behavioral;
