library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory is
    Port ( clk_in : in STD_LOGIC;
           write_in : in STD_LOGIC;
           adr_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end Memory;

architecture Behavioral of Memory is

    type stored_data is array (0 to 65535) of std_logic_vector(15 downto 0);
        signal content_bytes : stored_data := (others=>(others=>'0'));

begin

    process(clk_in)
    begin
        if rising_edge(clk_in) and (write_in = '1') then
            content_bytes(to_integer(unsigned(adr_in))) <= data_in;
        end if;
        if rising_edge(clk_in) and (write_in)='0' then -- read
            data_out <= content_bytes(to_integer(unsigned(adr_in)));
        end if;
    end process;

--    process(clk_in)
--    begin
--        if rising_edge(clk_in) then
--            if (write_in = '0') then -- read
--                data_out <= content_bytes(to_integer(unsigned(adr_in)));
--            elsif (write_in = '1') then -- write
--                content_bytes(to_integer(unsigned(adr_in))) <= data_in;
--            end if; 
--        end if;
--    end process;

end Behavioral;
