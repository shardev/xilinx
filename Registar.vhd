----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:53 01/04/2019 
-- Design Name: 
-- Module Name:    Registar - Behavioral 
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

entity Registar is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iDATA : in  STD_LOGIC_VECTOR (15 downto 0);
           iEN : in  STD_LOGIC;
           oQ : out  STD_LOGIC_VECTOR (15 downto 0));
end Registar;

architecture Behavioral of Registar is

	signal sREG : STD_LOGIC_VECTOR(15 downto 0);

begin

process(iCLK,inRST) begin
	if(inRST = '0') then
		sREG <= (others => '0');
	elsif(iCLK'event and iCLK = '1') then
		if(iEN = '1') then
			sREG <= iDATA;
		else
			sREG <= sREG;
		end if;
	end if;
end process;

oQ <= sREG;


end Behavioral;

