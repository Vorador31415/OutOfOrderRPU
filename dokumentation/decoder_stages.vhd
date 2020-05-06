
type store_1bit_array  is array(0 to 7) of std_logic;
type store_2bit_array  is array(0 to 7) of std_logic_vector(1 downto 0);
type store_3bit_array  is array(0 to 7) of std_logic_vector(2 downto 0);
type store_7bit_array  is array(0 to 7) of std_logic_vector(6 downto 0);
type store_16bit_array is array(0 to 7) of std_logic_vector(15 downto 0);

signal instruction_ready			: store_1bit_array	:= (others=>(others=>'0'));
signal memory_store_type			: store_1bit_array	:= (others=>(others=>'0'));
signal register_tag				 	: store_1bit_array	:= (others=>(others=>'0'));
signal ready_to_execute			 	: store_1bit_array	:= (others=>(others=>'0'));
signal executing				 	: store_1bit_array	:= (others=>(others=>'0'));
signal tag_status					: store_2bit_array	:= (others=>(others=>'0'));
signal Ergebnis_rob_register_ptr 	: store_3bit_array	:= (others=>(others=>'0'));
signal rob_register_ptr			 	: store_3bit_array	:= (others=>(others=>'0'));
signal quelleA_ptr					: store_3bit_array	:= (others=>(others=>'0'));
signal quelleB_ptr					: store_3bit_array	:= (others=>(others=>'0'));
signal rob_opcode					: store_7bit_array	:= (others=>(others=>'0'));
signal ergebnis_value				: store_16bit_array	:= (others=>(others=>'0'));
signal quelleA_value				: store_16bit_array	:= (others=>(others=>'0'));
signal quelleB_value				: store_16bit_array	:= (others=>(others=>'0'));



case ready_to_execute(0)..ready_to_execute(7) is
	when "1XXXXXXX" =>  ready_to_execute_ptr <= "000";
	when "01XXXXXX" =>  ready_to_execute_ptr <= "001";
	when "001XXXXX" =>  ready_to_execute_ptr <= "010";
	when "0001XXXX" =>  ready_to_execute_ptr <= "011";
		...
	when others =>  ready_to_execute_ptr <= "000";
end case;

Algorithmus:
	if rob_bool_full = '0'  or rob_bool_empty = '1'then
	
		get_instruction <= '1';
		Ergebnis_rob_register_ptr 					<= rob_tail_ptr;
		-- memory_store_type	(rob_tail_ptr)			<= '1' || '0';
		ergebnis_value		(rob_tail_ptr)			<= x"0000";
		rob_opcode			(rob_tail_ptr) 			<= befehl;
		instruction_ready	(rob_tail_ptr) 			<= '0';
		
		-- Besser: erster Takt wieviele Operanden & zweiter Takt alles Belegen
		if instruction_out(28 downto 27) = "00" then -- 0 Operanden
		
			if    instruction_out(26 downto 27) = OPCODE_RET then
			elsif instruction_out(26 downto 27) = OPCODE_NOP then
			elsif instruction_out(26 downto 27) = OPCODE_CLI then
			elsif instruction_out(26 downto 27) = OPCODE_SLI then
			elsif instruction_out(26 downto 27) = OPCODE_TIME then
				-- lege auf R15-Tag den Pointer ROB_TAIL_PTR
				rob_register_ptr(7) <= rob_tail_ptr
				register_tag	(7)	<= '1';
				memory_store_type(rob_tail_ptr) <= '0';
			end if;		
			
		elsif instruction_out(28 downto 27) = "01" then -- 1 operand
	
			if    instruction_out(26 downto 27) = OPCODE_INT   then
			elsif instruction_out(26 downto 27) = OPCODE_BSWAP then
				-- reg(15 downto 0) = reg(0 to 15)
			elsif instruction_out(26 downto 27) = OPCODE_DEC   then
				-- reg = reg - 1
			elsif instruction_out(26 downto 27) = OPCODE_INC   then
				-- reg = reg + 1
			elsif instruction_out(26 downto 27) = OPCODE_pop   then
			elsif instruction_out(26 downto 27) = OPCODE_push  then
			elsif instruction_out(26 downto 27) = OPCODE_not   then
				-- reg = not reg
			elsif instruction_out(26 downto 27) = OPCODE_cl    then
			elsif instruction_out(26 downto 27) = OPCODE_set   then
			elsif instruction_out(26 downto 27) = OPCODE_NEG   then
				-- reg = -reg
			elsif instruction_out(26 downto 27) = OPCODE_call  then
			elsif instruction_out(26 downto 27) = OPCODE_jmp   then -- 30 arten
			end if;
	
			if register_tag(instruction_out(18 downto 16)) = '0' then		
					quelleA_value	(rob_tail_ptr)	<=registerfile(instruction_out(18 downto 16));
					tag_status		(rob_tail_ptr)	<= "00";	
			elsif register_tag(instruction_out(18 downto 16)) = '1' then
					quelleA_ptr		(rob_tail_ptr)	<=rob_register_ptr(instruction_out(18 downto 16))
					tag_status		(rob_tail_ptr)	<= "10";
			end if;
		
		elsif instruction_out(28 downto 27) = "11" then -- 2 operanden

			if    instruction_out(28 downto 27) = OPCODE_add then
				if instruction_out(20 downto 19) = "00" then
					-- reg = reg + reg
				elsif instruction_out(20 downto 19) = "01" then
					-- reg = reg + imm16
				end if;
			elsif instruction_out(26 downto 27) = OPCODE_sub then
				if instruction_out(20 downto 19) = "00" then
					-- reg = reg - reg
				elsif instruction_out(20 downto 19) = "01" then
					-- reg = reg - imm16
				end if;
			elsif instruction_out(26 downto 27) = OPCODE_lea then
			elsif instruction_out(26 downto 27) = OPCODE_cmp then
			elsif instruction_out(26 downto 27) = OPCODE_in then
			elsif instruction_out(26 downto 27) = OPCODE_out then
			elsif instruction_out(26 downto 27) = OPCODE_test then
			elsif instruction_out(26 downto 27) = OPCODE_mov then
				if instruction_out(20 downto 19) = "00" then
					-- copy value from reg
				elsif instruction_out(20 downto 19) = "01" then
					-- read value from memory
				elsif instruction_out(20 downto 19) = "10" then
					-- write Value to Memory
				elsif instruction_out(20 downto 19) = "11" then
					-- load Value
				end if;
			elsif instruction_out(26 downto 27) = OPCODE_xchg then
			elsif instruction_out(26 downto 27) = OPCODE_rcl then
			elsif instruction_out(26 downto 27) = OPCODE_sal then
			elsif instruction_out(26 downto 27) = OPCODE_rcr then
			elsif instruction_out(26 downto 27) = OPCODE_sar then
			elsif instruction_out(26 downto 27) = OPCODE_rol then
			elsif instruction_out(26 downto 27) = OPCODE_shl then
			elsif instruction_out(26 downto 27) = OPCODE_ror then
			elsif instruction_out(26 downto 27) = OPCODE_shr then
			elsif instruction_out(26 downto 27) = OPCODE_and then
				if instruction_out(20 downto 19) = "00" then
					-- reg = reg and reg
				elsif instruction_out(20 downto 19) = "01" then
					-- reg = reg and imm16
				end if;
			elsif instruction_out(26 downto 27) = OPCODE_or then
				if instruction_out(20 downto 19) = "00" then
					-- reg = reg or reg
				elsif instruction_out(20 downto 19) = "01" then
					-- reg = reg or imm16
				end if;
			elsif instruction_out(26 downto 27) = OPCODE_xor then
				if instruction_out(20 downto 19) = "00" then
					-- reg = reg ^ reg
				elsif instruction_out(20 downto 19) = "01" then
					-- reg = reg ^ imm16
				end if;
			end if;
		
			case register_tag(instruction_out(18 downto 16))&register_tag(quell_register_ptrB) is
				when "00" =>
					quelleA_value	(rob_tail_ptr)	<=registerfile(instruction_out(18 downto 16));
					quelleB_value	(rob_tail_ptr)	<=registerfile(instruction_out(15 dwonto 13));
					tag_status		(rob_tail_ptr)	<= "00";	
				when "01" =>
					quelleA_ptr		(rob_tail_ptr)	<=rob_register_ptr(instruction_out(18 downto 16));
					quelleB_value	(rob_tail_ptr)	<=registerfile(instruction_out(15 dwonto 13));
					tag_status		(rob_tail_ptr)	<= "01";
				when "10" =>
					quelleB_ptr		(rob_tail_ptr)	<=rob_register_ptr(instruction_out(15 downto 13));
					quelleA_value	(rob_tail_ptr)	<=registerfile(instruction_out(18 downto 16));
					tag_status		(rob_tail_ptr)	<= "10";
				when "11" =>
					quelleA_ptr		(rob_tail_ptr)	<=rob_register_ptr(instruction_out(18 downto 16));
					quelleB_ptr		(rob_tail_ptr)	<=rob_register_ptr(instruction_out(15 downto 13));
					tag_status		(rob_tail_ptr)	<= "11";
			end case;
			
			
		end if;
		rob_tail_ptr <= rob_tail_ptr + x"01";
		
	elsif rob_bool_full = '1' then
	
		get_instruction <= '0';

		if get_result = '1' then
		
			ergebnis_value(Ergebnis_rob_register_ptr) <= result_fu;
			for i in 0 to 7 loop
				
				if tag_status(i)(1) = '1' then
					if quelleA_ptr(i) = Ergebnis_rob_register_ptr then
						quelleA_value(i) <= result_fu;
						tag_status(i)(1) <= '0';
						if tag_status(i)(0) = '0' then
							instruction_ready <= '1';
						end if;
					end if;
				end if;
				if tag_status(i)(0) = '1' then
					if quelleB_ptr(i) = Ergebnis_rob_register_ptr then
						quelleB_value(i) <= result_fu;
						tag_status(i)(0) <= '0';
						if tag_status(i)(1) = '0' then
							instruction_ready <= '1';
						end if;
					end if;
				end if;
				
			end loop;

		
		elsif get_result = '0' then
		
			-- sende Befehl an FU;
			if ready_to_execute(ready_to_execute_ptr) = '1' then
			
				executing(ready_to_execute_ptr) 		<= '1';
				ready_to_execute(ready_to_execute_ptr) 	<= '0';
				opcode 									<= rob_opcode;
				pointer 								<= ready_to_execute_ptr;
				ValueA 									<= QuelleA_value;
				ValueB 									<= QuelleB_value;
			
			end if;
		
		end if;
		
		if instruction_ready(rob_head_ptr) = '1' then
		
			if memory_store_type = '0' then
			
				registerfile(Ergebnis_rob_register_ptr(rob_head_ptr)) <= ergebnis_value(rob_head_ptr);
			
			end if;
			head_ptr <= head_ptr + x"01";
			
		end if;
	end if;


Functionunits:
	- Integer, Logic, compares
	- all Jumps
	- Load/Store