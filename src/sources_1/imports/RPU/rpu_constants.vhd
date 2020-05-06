library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package rpu_constants is

constant 	OPCODE_adb	: STD_LOGIC_VECTOR(5  downto 0) := X"01";
constant 	OPCODE_adc	: STD_LOGIC_VECTOR(5  downto 0) := X"02";
constant 	OPCODE_add	: STD_LOGIC_VECTOR(5  downto 0) := X"03";
constant 	OPCODE_and	: STD_LOGIC_VECTOR(5  downto 0) := X"04";
constant 	OPCODE_bswap	: STD_LOGIC_VECTOR(5  downto 0) := X"05";
constant 	OPCODE_call	: STD_LOGIC_VECTOR(5  downto 0) := X"06";
constant 	OPCODE_clFLAG	: STD_LOGIC_VECTOR(5  downto 0) := X"07";
constant 	OPCODE_cli	: STD_LOGIC_VECTOR(5  downto 0) := X"08";
constant 	OPCODE_cmc	: STD_LOGIC_VECTOR(5  downto 0) := X"09";
constant 	OPCODE_cmp	: STD_LOGIC_VECTOR(5  downto 0) := X"0A";
constant 	OPCODE_dec	: STD_LOGIC_VECTOR(5  downto 0) := X"0B";
constant 	OPCODE_in	: STD_LOGIC_VECTOR(5  downto 0) := X"0C";
constant 	OPCODE_inc	: STD_LOGIC_VECTOR(5  downto 0) := X"0D";
constant 	OPCODE_int	: STD_LOGIC_VECTOR(5  downto 0) := X"0E";
constant 	OPCODE_JA	: STD_LOGIC_VECTOR(5  downto 0) := X"0F";
constant 	OPCODE_JAE	: STD_LOGIC_VECTOR(5  downto 0) := X"10";
constant 	OPCODE_JB	: STD_LOGIC_VECTOR(5  downto 0) := X"11";
constant 	OPCODE_JBE	: STD_LOGIC_VECTOR(5  downto 0) := X"12";
constant 	OPCODE_JCXZ	: STD_LOGIC_VECTOR(5  downto 0) := X"13";
constant 	OPCODE_JE	: STD_LOGIC_VECTOR(5  downto 0) := X"14";
constant 	OPCODE_JG	: STD_LOGIC_VECTOR(5  downto 0) := X"15";
constant 	OPCODE_JGE	: STD_LOGIC_VECTOR(5  downto 0) := X"16";
constant 	OPCODE_JL	: STD_LOGIC_VECTOR(5  downto 0) := X"17";
constant 	OPCODE_JLE	: STD_LOGIC_VECTOR(5  downto 0) := X"18";
constant 	OPCODE_JMP	: STD_LOGIC_VECTOR(5  downto 0) := X"19";
constant 	OPCODE_JNA	: STD_LOGIC_VECTOR(5  downto 0) := X"1A";
constant 	OPCODE_JNAE	: STD_LOGIC_VECTOR(5  downto 0) := X"1B";
constant 	OPCODE_JNB	: STD_LOGIC_VECTOR(5  downto 0) := X"1C";
constant 	OPCODE_JNBE	: STD_LOGIC_VECTOR(5  downto 0) := X"1D";
constant 	OPCODE_JNE	: STD_LOGIC_VECTOR(5  downto 0) := X"1E";
constant 	OPCODE_JNG	: STD_LOGIC_VECTOR(5  downto 0) := X"1F";
constant 	OPCODE_JNGE	: STD_LOGIC_VECTOR(5  downto 0) := X"20";
constant 	OPCODE_JNL	: STD_LOGIC_VECTOR(5  downto 0) := X"21";
constant 	OPCODE_JNLE	: STD_LOGIC_VECTOR(5  downto 0) := X"22";
constant 	OPCODE_JNO	: STD_LOGIC_VECTOR(5  downto 0) := X"23";
constant 	OPCODE_JNP	: STD_LOGIC_VECTOR(5  downto 0) := X"24";
constant 	OPCODE_JNS	: STD_LOGIC_VECTOR(5  downto 0) := X"25";
constant 	OPCODE_JNZ	: STD_LOGIC_VECTOR(5  downto 0) := X"26";
constant 	OPCODE_JO	: STD_LOGIC_VECTOR(5  downto 0) := X"27";
constant 	OPCODE_JP	: STD_LOGIC_VECTOR(5  downto 0) := X"28";
constant 	OPCODE_JPE	: STD_LOGIC_VECTOR(5  downto 0) := X"29";
constant 	OPCODE_JPO	: STD_LOGIC_VECTOR(5  downto 0) := X"2A";
constant 	OPCODE_JS	: STD_LOGIC_VECTOR(5  downto 0) := X"2B";
constant 	OPCODE_JZ	: STD_LOGIC_VECTOR(5  downto 0) := X"2C";
constant 	OPCODE_lea	: STD_LOGIC_VECTOR(5  downto 0) := X"2D";
constant 	OPCODE_mov	: STD_LOGIC_VECTOR(5  downto 0) := X"2E";
constant 	OPCODE_movbd	: STD_LOGIC_VECTOR(5  downto 0) := X"2F";
constant 	OPCODE_movsx	: STD_LOGIC_VECTOR(5  downto 0) := X"30";
constant 	OPCODE_movsxd	: STD_LOGIC_VECTOR(5  downto 0) := X"31";
constant 	OPCODE_movzx	: STD_LOGIC_VECTOR(5  downto 0) := X"32";
constant 	OPCODE_neg	: STD_LOGIC_VECTOR(5  downto 0) := X"33";
constant 	OPCODE_nop	: STD_LOGIC_VECTOR(5  downto 0) := X"34";
constant 	OPCODE_not	: STD_LOGIC_VECTOR(5  downto 0) := X"35";
constant 	OPCODE_or	: STD_LOGIC_VECTOR(5  downto 0) := X"36";
constant 	OPCODE_out	: STD_LOGIC_VECTOR(5  downto 0) := X"37";
constant 	OPCODE_pop	: STD_LOGIC_VECTOR(5  downto 0) := X"38";
constant 	OPCODE_popf	: STD_LOGIC_VECTOR(5  downto 0) := X"39";
constant 	OPCODE_push	: STD_LOGIC_VECTOR(5  downto 0) := X"3A";
constant 	OPCODE_pushf	: STD_LOGIC_VECTOR(5  downto 0) := X"3B";
constant 	OPCODE_rcl	: STD_LOGIC_VECTOR(5  downto 0) := X"3C";
constant 	OPCODE_rcr	: STD_LOGIC_VECTOR(5  downto 0) := X"3D";
constant 	OPCODE_ret	: STD_LOGIC_VECTOR(5  downto 0) := X"3E";
constant 	OPCODE_rol	: STD_LOGIC_VECTOR(5  downto 0) := X"3F";
constant 	OPCODE_ror	: STD_LOGIC_VECTOR(5  downto 0) := X"40";
constant 	OPCODE_sal	: STD_LOGIC_VECTOR(5  downto 0) := X"41";
constant 	OPCODE_sar	: STD_LOGIC_VECTOR(5  downto 0) := X"42";
constant 	OPCODE_sbb	: STD_LOGIC_VECTOR(5  downto 0) := X"43";
constant 	OPCODE_setFLAG	: STD_LOGIC_VECTOR(5  downto 0) := X"44";
constant 	OPCODE_shl	: STD_LOGIC_VECTOR(5  downto 0) := X"45";
constant 	OPCODE_shr	: STD_LOGIC_VECTOR(5  downto 0) := X"46";
constant 	OPCODE_sli	: STD_LOGIC_VECTOR(5  downto 0) := X"47";
constant 	OPCODE_stc	: STD_LOGIC_VECTOR(5  downto 0) := X"48";
constant 	OPCODE_sub	: STD_LOGIC_VECTOR(5  downto 0) := X"49";
constant 	OPCODE_test	: STD_LOGIC_VECTOR(5  downto 0) := X"4A";
constant 	OPCODE_xchg	: STD_LOGIC_VECTOR(5  downto 0) := X"4B";
constant 	OPCODE_xor	: STD_LOGIC_VECTOR(5  downto 0) := X"4C";

constant FLAG_Zero      : integer := 0;
constant FLAG_Parity    : integer := 1;
constant FLAG_Direction : integer := 2;
constant FLAG_carry     : integer := 3;
constant FLAG_Overflow  : integer := 4;
constant FLAG_sign      : integer := 5;
constant FLAG_interupt  : integer := 6;

constant MSB_OPCODE     : integer := 26;
constant LSB_OPCODE     : integer := 21;
constant MSB_MOD     : integer := 20;
constant LSB_MOD     : integer := 19;
constant MSB_REG_DEST     : integer := 18;
constant LSB_REG_DEST     : integer := 16;
constant MSB_REG_SOURCE     : integer := 15;
constant LSB_REG_SOURCE     : integer := 13;

constant MSB_ADR_IMM_SOURCE     : integer := 18;
constant LSB_ADR_IMM_SOURCE     : integer := 3;

constant MSB_ADR_IMM_SOURCE2     : integer := 15;
constant LSB_ADR_IMM_SOURCE2     : integer := 0;

constant RAX : std_logic_vector(2 downto 0) := X"0";
constant RBX : std_logic_vector(2 downto 0) := X"1";
constant RCX : std_logic_vector(2 downto 0) := X"2";
constant RDX : std_logic_vector(2 downto 0) := X"3";
constant REX : std_logic_vector(2 downto 0) := X"4";
constant RFX : std_logic_vector(2 downto 0) := X"5";
constant RBP : std_logic_vector(2 downto 0) := X"6";
constant RSP : std_logic_vector(2 downto 0) := X"7";

end rpu_constants;

package body rpu_constants is

end rpu_constants;