library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reservation_station is
    Port ( clk_in : in STD_LOGIC;
           enable_in : in STD_LOGIC;
           write_en : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           adrA_in : in STD_LOGIC_VECTOR (1 downto 0);
           alu_op_out : out STD_LOGIC_VECTOR (5 downto 0));
end reservation_station;

architecture Behavioral of reservation_station is

    type stored_instruction is array (0 to 3) of std_logic_vector(5 downto 0);
        signal jobs : stored_instruction := (others=>(others=>'0'));
    type stored_rob_tag is array (0 to 3) of std_logic_vector(3 downto 0);
        signal rob_tag_source : stored_rob_tag := (others=>(others=>'0'));
        signal rob_tag_destA : stored_rob_tag := (others=>(others=>'0'));
        signal rob_tag_destB : stored_rob_tag := (others=>(others=>'0'));
    type stored_value is array (0 to 3) of std_logic_vector(15 downto 0);
        signal translate_robA : stored_value := (others=>(others=>'0'));
        signal translate_robB : stored_value := (others=>(others=>'0'));
        
    type stored_reg_status is array (0 to 3) of std_logic_vector(2 downto 0); -- from 0 0 0 untaged to 1 1 1 full taged
        signal bool_reg_status : stored_reg_status := (others=>"000");
    type stored_instruction_status is array (0 to 3) of std_logic_vector(1 downto 0);
        signal instruction_status : stored_instruction_status := (others=>"00"); -- 00=empty, 01=issu, 11=exe, 10=writeback 


begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then

            if enable_in='1' then
                if (write_en = '0') then -- read
                    alu_op_out <= jobs(to_integer(unsigned(adrA_in)));                   
                    -- read:
                    -- aluop with reg-values to ALU
                elsif (write_en = '1') then -- write
                    jobs(to_integer(unsigned(adrA_in))) <= data_in;
                    instruction_status(to_integer(unsigned(adrA_in))) <= "01";
                    -- write:
                    -- each value of registers
                    -- ROB-Tag
                end if;
                -- intern process:
                -- search for ready Instruction
             end if;   
        end if;
    end process;

end Behavioral;