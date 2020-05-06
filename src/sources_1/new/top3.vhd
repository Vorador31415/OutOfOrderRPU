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

entity top is
    Port ( 
        clk_in : in STD_LOGIC;
        -- versuche mal eine dynamische Clock, vielleicht eine Langsame, so 1 MHz und eine schnelle, so 400 MHz
        clk_timer : in STD_LOGIC;
        write_in : in STD_LOGIC;
        data_in : in std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0);
        Adr_out : out std_logic_vector(15 downto 0)
    
);
end top;

architecture Behavioral of top is

--    constant 	OPCODE_adb	: STD_LOGIC_VECTOR(5  downto 0) := X"01";
--    constant 	OPCODE_adc	: STD_LOGIC_VECTOR(5  downto 0) := X"02";
--    constant 	OPCODE_add	: STD_LOGIC_VECTOR(5  downto 0) := X"03";
--    constant 	OPCODE_and	: STD_LOGIC_VECTOR(5  downto 0) := X"04";
--    constant 	OPCODE_bswap    : STD_LOGIC_VECTOR(5  downto 0) := X"05";
--    constant 	OPCODE_call	: STD_LOGIC_VECTOR(5  downto 0) := X"06";
--    constant 	OPCODE_clFLAG	: STD_LOGIC_VECTOR(5  downto 0) := X"07";
--    constant 	OPCODE_cli	: STD_LOGIC_VECTOR(5  downto 0) := X"08";
--    constant 	OPCODE_cmc	: STD_LOGIC_VECTOR(5  downto 0) := X"09";
--    constant 	OPCODE_cmp	: STD_LOGIC_VECTOR(5  downto 0) := X"0A";
--    constant 	OPCODE_dec	: STD_LOGIC_VECTOR(5  downto 0) := X"0B";
--    constant 	OPCODE_in	: STD_LOGIC_VECTOR(5  downto 0) := X"0C";
--    constant 	OPCODE_inc	: STD_LOGIC_VECTOR(5  downto 0) := X"0D";
--    constant 	OPCODE_int	: STD_LOGIC_VECTOR(5  downto 0) := X"0E";
--    constant 	OPCODE_JA	: STD_LOGIC_VECTOR(5  downto 0) := X"0F";
--    constant 	OPCODE_JAE	: STD_LOGIC_VECTOR(5  downto 0) := X"10";
--    constant 	OPCODE_JB	: STD_LOGIC_VECTOR(5  downto 0) := X"11";
--    constant 	OPCODE_JBE	: STD_LOGIC_VECTOR(5  downto 0) := X"12";
--    constant 	OPCODE_JCXZ	: STD_LOGIC_VECTOR(5  downto 0) := X"13";
--    constant 	OPCODE_JE	: STD_LOGIC_VECTOR(5  downto 0) := X"14";
--    constant 	OPCODE_JG	: STD_LOGIC_VECTOR(5  downto 0) := X"15";
--    constant 	OPCODE_JGE	: STD_LOGIC_VECTOR(5  downto 0) := X"16";
--    constant 	OPCODE_JL	: STD_LOGIC_VECTOR(5  downto 0) := X"17";
--    constant 	OPCODE_JLE	: STD_LOGIC_VECTOR(5  downto 0) := X"18";
--    constant 	OPCODE_JMP	: STD_LOGIC_VECTOR(5  downto 0) := X"19";
--    constant 	OPCODE_JNA	: STD_LOGIC_VECTOR(5  downto 0) := X"1A";
--    constant 	OPCODE_JNAE	: STD_LOGIC_VECTOR(5  downto 0) := X"1B";
--    constant 	OPCODE_JNB	: STD_LOGIC_VECTOR(5  downto 0) := X"1C";
--    constant 	OPCODE_JNBE	: STD_LOGIC_VECTOR(5  downto 0) := X"1D";
--    constant 	OPCODE_JNE	: STD_LOGIC_VECTOR(5  downto 0) := X"1E";
--    constant 	OPCODE_JNG	: STD_LOGIC_VECTOR(5  downto 0) := X"1F";
--    constant 	OPCODE_JNGE	: STD_LOGIC_VECTOR(5  downto 0) := X"20";
--    constant 	OPCODE_JNL	: STD_LOGIC_VECTOR(5  downto 0) := X"21";
--    constant 	OPCODE_JNLE	: STD_LOGIC_VECTOR(5  downto 0) := X"22";
--    constant 	OPCODE_JNO	: STD_LOGIC_VECTOR(5  downto 0) := X"23";
--    constant 	OPCODE_JNP	: STD_LOGIC_VECTOR(5  downto 0) := X"24";
--    constant 	OPCODE_JNS	: STD_LOGIC_VECTOR(5  downto 0) := X"25";
--    constant 	OPCODE_JNZ	: STD_LOGIC_VECTOR(5  downto 0) := X"26";
--    constant 	OPCODE_JO	: STD_LOGIC_VECTOR(5  downto 0) := X"27";
--    constant 	OPCODE_JP	: STD_LOGIC_VECTOR(5  downto 0) := X"28";
--    constant 	OPCODE_JPE	: STD_LOGIC_VECTOR(5  downto 0) := X"29";
--    constant 	OPCODE_JPO	: STD_LOGIC_VECTOR(5  downto 0) := X"2A";
--    constant 	OPCODE_JS	: STD_LOGIC_VECTOR(5  downto 0) := X"2B";
--    constant 	OPCODE_JZ	: STD_LOGIC_VECTOR(5  downto 0) := X"2C";
--    constant 	OPCODE_lea	: STD_LOGIC_VECTOR(5  downto 0) := X"2D";
--    constant 	OPCODE_mov	: STD_LOGIC_VECTOR(5  downto 0) := X"2E";
--    constant 	OPCODE_movbd	: STD_LOGIC_VECTOR(5  downto 0) := X"2F";
--    constant 	OPCODE_movsx	: STD_LOGIC_VECTOR(5  downto 0) := X"30";
--    constant 	OPCODE_movsxd	: STD_LOGIC_VECTOR(5  downto 0) := X"31";
--    constant 	OPCODE_movzx	: STD_LOGIC_VECTOR(5  downto 0) := X"32";
--    constant 	OPCODE_neg	: STD_LOGIC_VECTOR(5  downto 0) := X"33";
--    constant 	OPCODE_nop	: STD_LOGIC_VECTOR(5  downto 0) := X"34";
--    constant 	OPCODE_not	: STD_LOGIC_VECTOR(5  downto 0) := X"35";
--    constant 	OPCODE_or	: STD_LOGIC_VECTOR(5  downto 0) := X"36";
--    constant 	OPCODE_out	: STD_LOGIC_VECTOR(5  downto 0) := X"37";
--    constant 	OPCODE_pop	: STD_LOGIC_VECTOR(5  downto 0) := X"38";
--    constant 	OPCODE_popf	: STD_LOGIC_VECTOR(5  downto 0) := X"39";
--    constant 	OPCODE_push	: STD_LOGIC_VECTOR(5  downto 0) := X"3A";
--    constant 	OPCODE_pushf	: STD_LOGIC_VECTOR(5  downto 0) := X"3B";
--    constant 	OPCODE_rcl	: STD_LOGIC_VECTOR(5  downto 0) := X"3C";
--    constant 	OPCODE_rcr	: STD_LOGIC_VECTOR(5  downto 0) := X"3D";
--    constant 	OPCODE_ret	: STD_LOGIC_VECTOR(5  downto 0) := X"3E";
--    constant 	OPCODE_rol	: STD_LOGIC_VECTOR(5  downto 0) := X"3F";

--    constant 	OPCODE_ror	: STD_LOGIC_VECTOR(5  downto 0) := X"40";
--    constant 	OPCODE_sal	: STD_LOGIC_VECTOR(5  downto 0) := X"41";
--    constant 	OPCODE_sar	: STD_LOGIC_VECTOR(5  downto 0) := X"42";
--    constant 	OPCODE_sbb	: STD_LOGIC_VECTOR(5  downto 0) := X"43";
--    constant 	OPCODE_setFLAG	: STD_LOGIC_VECTOR(5  downto 0) := X"44";
--    constant 	OPCODE_shl	: STD_LOGIC_VECTOR(5  downto 0) := X"45";
--    constant 	OPCODE_shr	: STD_LOGIC_VECTOR(5  downto 0) := X"46";
--    constant 	OPCODE_sli	: STD_LOGIC_VECTOR(5  downto 0) := X"47";
--    constant 	OPCODE_stc	: STD_LOGIC_VECTOR(5  downto 0) := X"48";
--    constant 	OPCODE_sub	: STD_LOGIC_VECTOR(5  downto 0) := X"49";
--    constant 	OPCODE_test	: STD_LOGIC_VECTOR(5  downto 0) := X"4A";
--    constant 	OPCODE_xchg	: STD_LOGIC_VECTOR(5  downto 0) := X"4B";
--    constant 	OPCODE_xor	: STD_LOGIC_VECTOR(5  downto 0) := X"4C";
         
    -- Rob Status:
    -- 00 empty
    -- 01 instruction stored
    -- 10 instruction busy
    -- 11 final

    -- Time unit
    signal time_counter : std_logic_vector(15 downto 0) := x"0000";
    
    -- Memory
    signal memory_out : std_logic_vector(31 downto 0);
    type memory_data is array (0 to 2048) of std_logic_vector(31 downto 0);
        --signal content_bytes : memory_data := (others=>x"04D00000");
--        signal content_bytes : memory_data := (others=>"0000"&x"19"&"10"&x"31"&"0000000000");
        signal content_bytes : memory_data :=
        (
            x"04D00000",
            "0000"&x"19"&"10"&x"02"&"0000000000",
            "0000"&x"19"&"10"&x"00"&"0000000000",
            "0000"&x"19"&"01"&x"00"&"0000000000",
            "0000"&x"19"&"10"&x"00"&"0000000000",
            "0000"&x"19"&"10"&x"00"&"0000000000",
            others=>(others=>'0')
        );
    
    -- Interface between Instruction_Query and Fetch
    signal inst_query_write_en : std_logic;
    signal instruction_in : std_logic_vector(26 downto 0);
    
    -- Internal Fetch
    signal programm_counter : std_logic_vector(10 downto 0) := (others=>'0'); 
    
    -- Internal Instruction Query
    signal inst_query_bool_full : std_logic;
    signal inst_query_bool_empty : std_logic;
    signal inst_query_ptr_head : std_logic_vector(3 downto 0) := (others=>'0');
    signal inst_query_ptr_tail : std_logic_vector(3 downto 0) := (others=>'0');
    type stored_instructions is array (0 to 15) of std_logic_vector(26 downto 0);
        signal instructions : stored_instructions := (others=>(others=>'0'));
        
    -- Interface Instruction Query and Decoder
    signal get_instruction_from_query : std_logic;
    signal instruction_out : std_logic_vector(26 downto 0);
    
    -- Interface Decoder and Reorder Buffer
    signal rob_bool_full : std_logic;
    signal rob_bool_empty : std_logic;
    signal bool_adr_eq_head : std_logic;
    signal rob_write_en : std_logic;
    signal instruction_from_decoder : std_logic_vector(6 downto 0);
    signal result_register_in: std_logic_vector(2 downto 0);
    
    -- Internal Reorder Buffer
    signal rob_head : std_logic_vector(2 downto 0) := "000";
    signal rob_tail : std_logic_vector(2 downto 0) := "000";
    type stored_instruction is array (0 to 7) of std_logic_vector(6 downto 0); -- gespeicherte Instruction
        signal rob_instruction : stored_instruction := (others=>(others=>'0'));
    type stored_register_ptr is array (0 to 7) of std_logic_vector(2 downto 0); -- gespeicherter Register Pointer
        signal rob_register : stored_register_ptr := (others=>(others=>'0'));
    type stored_value is array (0 to 7) of std_logic_vector(15 downto 0); -- gespeichertes Ergebnis
        signal rob_value : stored_value := (others=>(others=>'0'));
    type stored_status is array (0 to 7) of std_logic_vector (1 downto 0); -- gespeicherter Status der Instruction: empty,busy,ready
        signal rob_status : stored_status := (others=>(others=>'0'));
    signal writeback_ready : std_logic := '0';    
    
    -- Interface Decoder and Reservation Station
    signal instruction_to_RS : std_logic_vector(6 downto 0);
    -- Interface RS and FU
    signal instruction_from_RS : std_logic_vector(6 downto 0);
       
    -- Interface RS outside
    signal result_fu : std_logic_vector(15 downto 0);
    signal result_rob_adr : std_logic_vector(2 downto 0);
    signal get_result_in : std_logic;
    
    -- Internal Reservation Station
    -- Opcode, Result-Reg-Tag, Quell-Reg-Tag-A, Quell-Reg-Tag-B , Quell-Value-A, Quell-Value-B, 3-Bit-Tag-or-NotTag
    type stored_opcode is array(0 to 3) of std_logic_vector(6 downto 0);
        signal opcode : stored_opcode := (others=>(others=>'0'));
    type stored_result_reg_tag is array(0 to 3) of std_logic_vector(2 downto 0);
        signal result_reg_tag : stored_result_reg_tag := (others=>(others=>'0'));
    signal  next_free_ptr : std_logic_vector(1 downto 0) := "00";
    type stored_rs_status is array (0 to 2) of std_logic_vector (1 downto 0); -- empty, busy, ready, executing
        signal rs_status : stored_rs_status := (others=>(others=>'0'));
    
    -- Interface Register File
    signal  register_read : std_logic;
    signal  register_in : std_logic_vector(15 downto 0);
    signal  register_out : std_logic_vector(15 downto 0);
    signal  register_adr : STD_LOGIC_VECTOR(2 downto 0);
    type stored_data is array (0 to 7) of std_logic_vector(15 downto 0);
        signal registers : stored_data := (others=>(others=>'0'));
    type stored_rob_ptr is array (0 to 7) of std_logic_vector(3 downto 0); -- zusätzliches Bit als Tag-Flag
        signal rob_ptr : stored_rob_ptr := (others=> (others=>'0'));
        
    
    
    

begin

    -- Memory
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if write_in = '1' then
                content_bytes(to_integer(unsigned(Programm_counter)))(31 downto 16) <= data_in ;
                content_bytes(to_integer(unsigned(Programm_counter)))(15 downto 0 ) <=  (others=>'0');
            elsif write_in = '0' then
                memory_out <= content_bytes(to_integer(unsigned(Programm_counter)));
            end if;
        end if;
    end process;

    -- Timer Unit
    process(clk_timer)
    begin
        if rising_edge(clk_timer) then
            time_counter <= time_counter + x"001";
        end if;
    end process;

    -- Fetch Instruction in die Instruction-Query und zähle den PC hoch
    --    Falls ein direkter JMP auftaucht und direkt ausgeführt werden kann, ändere den PC
    -- Fetch
    --    Required  2.155 ns
    --Adr_out <= Programm_counter;
    
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if memory_out(26 downto 18) = x"19" & "01" then -- JMP Adr
                --programm_counter <= memory_out(17 downto 2);
                programm_counter <= memory_out(17 downto 7);
            elsif memory_out(26 downto 18) = x"19" & "10" then -- JMP Imm
--                programm_counter <= memory_out(17 downto 2); 
                programm_counter <= memory_out(17 downto 7); 
            elsif inst_query_bool_full = '0' then
                Programm_counter <= Programm_counter + x"02";
                instruction_in <= memory_out(26 downto 0);
                inst_query_write_en <= '1';
            elsif inst_query_bool_full = '1' then
                inst_query_write_en <= '0';
            end if;
        end if;
    end process;
    
    -- Instruction Query
    --    Required  2.155 ns
    inst_query_bool_full  <= '1' when unsigned(inst_query_ptr_tail+1) = unsigned(inst_query_ptr_head) else '0';
    inst_query_bool_empty <= '1' when unsigned(inst_query_ptr_tail)   = unsigned(inst_query_ptr_head) else '0';
    process (clk_in)
    begin
        if rising_edge(clk_in) then
            if (inst_query_write_en = '1' and inst_query_bool_full = '0') then
                instructions(to_integer(unsigned(inst_query_ptr_tail))) <= instruction_in;
                inst_query_ptr_tail <= inst_query_ptr_tail + "0001";
            end if;
            if (get_instruction_from_query = '1' and inst_query_bool_empty = '0') then
                instruction_out <= instructions(to_integer(unsigned(inst_query_ptr_head)));
                inst_query_ptr_head <= inst_query_ptr_head + "0001";
            end if; 
            -- if Exception: Falscher Sprung || Interupt
        end if;
    end process;
    
    -- decodiere eine Instruction aus der Instructions-Query in den ROB und RS
    --    benutze den ptr_tail des ROB als Tag des Result-Registers,
    --    setze das TAG im Register-File, 
    --    und überprüfe, ob die Quell-Register schon einen ROB-Tag haben:
    --       ja: übernehme den ROB-Tag
    --       nein: übernehme den Wert im Register
    
    -- Reorder Buffer
    -- ToDO: merge Reorder Buffer and Reservation Station
    rob_bool_full <= '1'  when unsigned(rob_tail+1) = unsigned(rob_head) else '0';
    rob_bool_empty <= '1' when unsigned(rob_tail)   = unsigned(rob_head) else '0';
    writeback_ready <= '1' when rob_status(to_integer(unsigned(rob_head))) = "11" else '0';
    bool_adr_eq_head <= '1' when unsigned(rob_head) = unsigned(result_rob_adr) else '0';
    
    -- Decoder: feed Reorder Buffer and Reservation Station
    process(clk_in)
    begin
        if rising_edge(clk_in) then
        

        end if;
    end process;
    
    -- Register-File
    process(clk_in)
    begin
        if rising_edge(clk_in) then
           -- if enable_in='1' then
                if (register_read = '1') then -- read
                    register_out <= registers(to_integer(unsigned(register_adr)));
                elsif (register_read = '0') then -- write
                    registers(to_integer(unsigned(register_adr))) <= register_in;
                end if;
            -- end if;   
        end if;
    end process;
    
    
    -- wenn FU ein Result_Value:
    --   ja: caste Ergbenis auf Bus                
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            case instruction_from_RS is
                when "1001101" =>
                    result_fu <= time_counter;
                    get_result_in <= '1';
                    result_rob_adr <= result_reg_tag(0) ;
                when others =>
                    result_fu <= (others=>'0');
                    get_result_in <= '0';
                    result_rob_adr <= (others=>'0');
            end case;
            
            data_out <= register_out;
        end if;
    end process;
    
                
    -- Exception\Interupt-Handling
    

    
   
end Behavioral;