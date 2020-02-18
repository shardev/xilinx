----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:47:33 01/04/2019 
-- Design Name: 
-- Module Name:    Multiplekser - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplekser is
    Port ( iD0 : in  STD_LOGIC_VECTOR (15 downto 0);
           iD1 : in  STD_LOGIC_VECTOR (15 downto 0);
           iD2 : in  STD_LOGIC_VECTOR (15 downto 0);
           iD3 : in  STD_LOGIC_VECTOR (15 downto 0);
           iD4 : in  STD_LOGIC_VECTOR (15 downto 0);
           iD5 : in  STD_LOGIC_VECTOR (15 downto 0);
           iD6 : in  STD_LOGIC_VECTOR (15 downto 0);
           iD7 : in  STD_LOGIC_VECTOR (15 downto 0);
           iD8 : in  STD_LOGIC_VECTOR (15 downto 0);
           iSEL : in  STD_LOGIC_VECTOR (3 downto 0);
           oQ : out  STD_LOGIC_VECTOR (15 downto 0));
end Multiplekser;

architecture Behavioral of Multiplekser is

	signal sMUX : STD_LOGIC_VECTOR(15 downto 0);

begin

process(iD0,iD1,iD2,iD3,iD4,iD5,iD6,iD7,iD8,iSEL) begin
	case(iSEL) is
		when "0000" => sMUX <= iD0;
		when "0001" => sMUX <= iD1;
		when "0010" => sMUX <= iD2;
		when "0011" => sMUX <= iD3;
		when "0100" => sMUX <= iD4;
		when "0101" => sMUX <= iD5;
		when "0110" => sMUX <= iD6;
		when "0111" => sMUX <= iD7;
		when "1000" => sMUX <= iD8;
		when others => sMUX <= (others => '0');
	end case;
end process;

oQ <= sMUX;

end Behavioral;

