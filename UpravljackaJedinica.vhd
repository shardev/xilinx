----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:18 01/04/2019 
-- Design Name: 
-- Module Name:    UpravljackaJedinica - Behavioral 
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

entity UpravljackaJedinica is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           oREG_WE : out  STD_LOGIC_VECTOR (7 downto 0);
           oMUXA_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oMUXB_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oALU_SEL : out  STD_LOGIC_VECTOR (3 downto 0));
end UpravljackaJedinica;

architecture Behavioral of UpravljackaJedinica is

	type tSTATE is (S1,S2,S3,NOP);
	signal sSTATE, sNEXT : tSTATE;

	begin

	process(sSTATE) begin
		case(sSTATE) is
			when S1 =>	oREG_WE <= "00000010";
							oMUXA_SEL <= "0000";
							oMUXB_SEL <= "1111";
							oALU_SEL <= "0110";
			
			when S2 =>  oREG_WE <= "00000100";
							oMUXA_SEL <= "0000";
							oMUXB_SEL <= "0001";
							oALU_SEL <= "0001";
							
			when S3 =>	oREG_WE <= "00001000";
							oMUXA_SEL <= "0001";
							oMUXB_SEL <= "0010";
							oALU_SEL <= "0110";
							
			when others => oREG_WE <= "00000000";
							oMUXA_SEL <= "1111";
							oMUXB_SEL <= "1111";
							oALU_SEL <= "1111";
		end case;
	end process;
	
	process(iCLK,inRST) begin
		if(inRST = '0') then
			sSTATE <= S1;
		elsif(iCLK'event and iCLK = '1') then
			sSTATE <= sNEXT;
		end if;
	end process;
	
	process(sSTATE) begin
		case(sSTATE) is
			when S1 =>	sNEXT <= S2;
			
			when S2 =>  sNEXT <= S3;
							
			when S3 =>	sNEXT <= NOP;
							
			when others => sNEXT <= sSTATE;
		end case;
	end process;
	
end Behavioral;

