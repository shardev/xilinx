----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:22 01/04/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( iA : in  STD_LOGIC_VECTOR (15 downto 0);
           iB : in  STD_LOGIC_VECTOR (15 downto 0);
           iSEL : in  STD_LOGIC_VECTOR (3 downto 0);
           oC : out  STD_LOGIC_VECTOR (15 downto 0);
           oZERO : out  STD_LOGIC;
           oCARRY : out  STD_LOGIC;
           oSIGN : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

	signal sALU : STD_LOGIC_VECTOR(15 downto 0);
	signal sPOM : STD_LOGIC_VECTOR(16 downto 0);

begin

process(iA,iB,iSEL) begin
	case(iSEL) is
		when "0000" => sALU <= 	iA;
							sPOM <= (others => '0');
		when "0001" => sALU <= 	iA + iB;
							sPOM <= ('0' & iA) + ('0' & iB);
		when "0010" => sALU <= 	iA - iB;
							sPOM <= (others => '0');
		when "0011" => sALU <= 	iA and iB;
							sPOM <= (others => '0');
		when "0100" => sALU <= 	iA or iB;
							sPOM <= (others => '0');
		when "0101" => sALU <= 	not(iA);
							sPOM <= (others => '0');
		when "0110" => sALU <= 	iA + 1;
							sPOM <= 	('0' & iA) + 1;
		when "0111" => sALU <= 	iA - 1;
							sPOM <= (others => '0');
		when "1000" => sALU <= 	iA(14 downto 0) & '0';
							sPOM <= (others => '0');
		when "1001" => sALU <= 	'0' & iA(15 downto 1);
							sPOM <= (others => '0');
		when "1010" => sALU <= 	0 - iA;
							sPOM <= (others => '0');
		when "1011" => sALU <= 	iA(15) & iA(15 downto 1);
							sPOM <= (others => '0');
		when others => sALU <= 	(others => '0');
							sPOM <= (others => '0');
	end case;
end process;

oC <= sALU;

process(sALU,sPOM) begin
	if(sALU = 0) then
		oZERO <= '0';
	else
		oZERO <= '1';
	end if;
	if(sALU(15) = '1') then
		oSIGN <= '1';
	else
		oSIGN <= '0';
	end if;
	if(sPOM(16) = '1') then
		oCARRY <= '1';
	else
		oCARRY <= '0';
	end if;
end process;

end Behavioral;

