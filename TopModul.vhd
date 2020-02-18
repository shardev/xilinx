----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:11:39 01/04/2019 
-- Design Name: 
-- Module Name:    TopModul - Behavioral 
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

entity TopModul is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iDATA : in  STD_LOGIC_VECTOR (15 downto 0);
           oDATA : out  STD_LOGIC_VECTOR (15 downto 0));
end TopModul;

architecture Behavioral of TopModul is

component UpravljackaJedinica is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           oREG_WE : out  STD_LOGIC_VECTOR (7 downto 0);
           oMUXA_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oMUXB_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           oALU_SEL : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component ALU is
    Port ( iA : in  STD_LOGIC_VECTOR (15 downto 0);
           iB : in  STD_LOGIC_VECTOR (15 downto 0);
           iSEL : in  STD_LOGIC_VECTOR (3 downto 0);
           oC : out  STD_LOGIC_VECTOR (15 downto 0);
           oZERO : out  STD_LOGIC;
           oCARRY : out  STD_LOGIC;
           oSIGN : out  STD_LOGIC);
end component;

component Multiplekser is
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
end component;

component Registar is
    Port ( iCLK : in  STD_LOGIC;
           inRST : in  STD_LOGIC;
           iDATA : in  STD_LOGIC_VECTOR (15 downto 0);
           iEN : in  STD_LOGIC;
           oQ : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

	signal sEN : STD_LOGIC_VECTOR(7 downto 0);
	signal sREG0,sREG1,sREG2,sREG3,sREG4,sREG5,sREG6,sREG7 : STD_LOGIC_VECTOR(15 downto 0);
	signal sRESULT : STD_LOGIC_VECTOR(15 downto 0);
	signal sMUX1, sMUX2 : STD_LOGIC_VECTOR(15 downto 0);
	signal sMUX1_SEL,sMUX2_SEL,sALU_SEL : STD_LOGIC_VECTOR(3 downto 0);
	signal sZERO,sCARRY,sSIGN : STD_LOGIC;
	
begin
	
	REG0 : Registar port map(
					iCLK => iCLK,
					inRST => inRST,
					iEN => sEN(0),
					iDATA => sRESULT,
					oQ => sREG0
	);
	
	REG1 : Registar port map(
					iCLK => iCLK,
					inRST => inRST,
					iEN => sEN(1),
					iDATA => sRESULT,
					oQ => sREG1
	);
	
	REG2 : Registar port map(
					iCLK => iCLK,
					inRST => inRST,
					iEN => sEN(2),
					iDATA => sRESULT,
					oQ => sREG2
	);
	
	REG3 : Registar port map(
					iCLK => iCLK,
					inRST => inRST,
					iEN => sEN(3),
					iDATA => sRESULT,
					oQ => sREG3
	);
	
	REG4 : Registar port map(
					iCLK => iCLK,
					inRST => inRST,
					iEN => sEN(4),
					iDATA => sRESULT,
					oQ => sREG4
	);
	
	REG5 : Registar port map(
					iCLK => iCLK,
					inRST => inRST,
					iEN => sEN(5),
					iDATA => sRESULT,
					oQ => sREG5
	);
	
	REG6 : Registar port map(
					iCLK => iCLK,
					inRST => inRST,
					iEN => sEN(6),
					iDATA => sRESULT,
					oQ => sREG6
	);
	
	REG7 : Registar port map(
					iCLK => iCLK,
					inRST => inRST,
					iEN => sEN(7),
					iDATA => sRESULT,
					oQ => sREG7
	);
	
	MUX1 : Multiplekser port map(
					iD0 => sREG0,
					iD1 => sREG1,
					iD2 => sREG2,
					iD3 => sREG3,
					iD4 => sREG4,
					iD5 => sREG5,
					iD6 => sREG6,
					iD7 => sREG7,
					iD8 => iDATA,
					iSEL => sMUX1_SEL,
					oQ => sMUX1
	);
	
	MUX2 : Multiplekser port map(
					iD0 => sREG0,
					iD1 => sREG1,
					iD2 => sREG2,
					iD3 => sREG3,
					iD4 => sREG4,
					iD5 => sREG5,
					iD6 => sREG6,
					iD7 => sREG7,
					iD8 => iDATA,
					iSEL => sMUX2_SEL,
					oQ => sMUX2
	);
	
	ALU1 : ALU port map(
					iA => sMUX1,
					iB => sMUX2,
					iSEL => sALU_SEL,
					oC => sRESULT,
					oZERO => sZERO,
					oCARRY => sCARRY,
					oSIGN => sSIGN
	);
	
	UJ : UpravljackaJedinica port map(
					iCLK => iCLK,
					inRST => inRST,
					oREG_WE => sEN,
					oMUXA_SEL => sMUX1_SEL,
					oMUXB_SEL => sMUX2_SEL,
					oALU_SEL => sALU_SEL
	);
	
	oDATA <= sRESULT;	
	
end Behavioral;
	
