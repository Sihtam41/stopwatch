----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:35:11 01/17/2023 
-- Design Name: 
-- Module Name:    display - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
    Port ( CLK : in  STD_LOGIC;
           hun : in  STD_LOGIC_VECTOR (3 downto 0);
           tenth : in  STD_LOGIC_VECTOR (3 downto 0);
           unit : in  STD_LOGIC_VECTOR (3 downto 0);
           ten : in  STD_LOGIC_VECTOR (3 downto 0);
           SEG : out  STD_LOGIC_VECTOR (7 downto 0);
           base : out  STD_LOGIC_VECTOR (3 downto 0));
end display;

architecture Behavioral of display is

component bin7seg is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0);
			  point : in STD_LOGIC);
end component;

signal curent_unit : STD_LOGIC_VECTOR (3 downto 0);
signal nb : STD_LOGIC_VECTOR (1 downto 0);
signal point : STD_LOGIC;

begin



process(CLK)
begin
	if(CLK'event and CLK = '1') then
	
	nb <= nb + 1;
	
	case nb is
		when "00" => base <= "1000";
						 curent_unit <= ten;
						 point <= '0';
		when "01" => base <= "0100";
						 curent_unit <= unit;
						 point <= '1';
		when "10" => base <= "0010";
						 curent_unit <= tenth;
						 point <= '0';
		when others => base <= "0001";
						 curent_unit <= hun;	
						 point <= '0';
	end case;
	
	
	
	end if;
end process;


aa: bin7seg port map(curent_unit , SEG, point);
end Behavioral;

