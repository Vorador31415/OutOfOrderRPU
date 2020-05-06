library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rob is
    Port ( clk_in : in STD_LOGIC;
           
           -- debug
           ptr_head_out : out STD_LOGIC_VECTOR (3 downto 0);
           
           -- interface to Reservation_station
           get_instruction_in : in std_logic;
           ptr_tail_out : out STD_LOGIC_VECTOR (3 downto 0);
           instruction_out : out std_logic_vector(5 downto 0); -- replace with PC ?
           
           -- interface to Instruction_query
           full_out : out STD_LOGIC;
           empty_out : out STD_LOGIC;
           
           -- Interface from Instruction_query
           enable_in : in STD_LOGIC;
           write_en : in STD_LOGIC;
           instruction_in : in std_logic_vector(5 downto 0); -- replace with PC ?
           result_register_in : in std_logic_vector(2 downto 0);
           
           -- from Funktion Units
           get_result_in : in std_logic;
           result_in : in STD_LOGIC_VECTOR (15 downto 0); 
           adr_in : in STD_LOGIC_VECTOR (2 downto 0);
                     
           -- Interface to Registers
           adr_reg_out : out std_logic_vector(2 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end rob;

architecture Behavioral of rob is

    type stored_instruction is array (0 to 7) of std_logic_vector(5 downto 0);
        signal rob_instruction : stored_instruction := (others=>(others=>'0'));
    type stored_register_ptr is array (0 to 7) of std_logic_vector(2 downto 0);
        signal rob_register : stored_register_ptr := (others=>(others=>'0'));
    type stored_value is array (0 to 7) of std_logic_vector(15 downto 0);
        signal rob_value : stored_value := (others=>(others=>'0'));
    type stored_status is array (0 to 7) of std_logic_vector (1 downto 0);
        signal rob_status : stored_status := (others=>(others=>'0'));
        
    -- Rob Status:
    -- 00 empty
    -- 01 instruction stored
    -- 10 instruction busy
    -- 11 final
    
        
    signal bool_adr_eq_head : std_logic:='0';
    
    signal bool_full : std_logic:='0';
    signal bool_empty : std_logic:='1';
    
    signal rob_head : std_logic_vector(3 downto 0);
    signal rob_tail : std_logic_vector(3 downto 0);


begin
    ptr_head_out <= rob_head;
    ptr_tail_out <= rob_tail;

    process (clk_in)
    begin
        if rising_edge(clk_in) then
            if (write_en = '1' and bool_full = '0') then
                -- input Instruction, rob_pt and result register
                -- Rob_tail is next free ROB_ptr
                rob_instruction(to_integer(unsigned(rob_tail))) <= instruction_in;
                rob_register(to_integer(unsigned(rob_tail))) <= result_register_in;
                rob_status(to_integer(unsigned(rob_tail))) <= "01";
                rob_tail <= rob_tail + "0001";
            end if;
            if write_en = '0' and bool_empty = '0' and get_instruction_in = '1' then
                instruction_out <= rob_instruction(to_integer(unsigned(rob_head)));
                rob_head <= rob_head + "0001";
            end if;
            if get_result_in = '1' and bool_adr_eq_head = '0' then
                rob_value(to_integer(unsigned(adr_in))) <= result_in;
                rob_status(to_integer(unsigned(adr_in))) <= "11";
            elsif get_result_in = '1' and bool_adr_eq_head = '1' then
                data_out <= result_in;
                adr_reg_out <= rob_register(to_integer(unsigned(adr_in)));
                rob_status(to_integer(unsigned(adr_in))) <= "00";
                rob_head <= rob_head + "0001";
            end if;
            --pseudo:
            -- if Head = calculated => write to Registers
        end if;
    end process;
    
    bool_adr_eq_head <= '1' when unsigned(rob_head) = unsigned(adr_in) else '0';
    
    full_out <= '1' when unsigned(rob_tail+1) = unsigned(rob_head) else '0';
    bool_full <= '1' when unsigned(rob_tail+1) = unsigned(rob_head) else '0';
    
    empty_out <= '1' when unsigned(rob_tail) = unsigned(rob_head) else '0';
    bool_empty <= '1' when unsigned(rob_tail) = unsigned(rob_head) else '0';

end Behavioral;