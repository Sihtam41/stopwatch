----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:54 01/18/2023 
-- Design Name: 
-- Module Name:    command - Behavioral 
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

entity command is
    Port ( BT1 : in  STD_LOGIC;--stop
           BT2 : in  STD_LOGIC;--reset
           reset : out  STD_LOGIC;
           stop : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  hun : in  STD_LOGIC_VECTOR (3 downto 0);
           tenth : in  STD_LOGIC_VECTOR (3 downto 0);
           unit : in  STD_LOGIC_VECTOR (3 downto 0);
           ten : in  STD_LOGIC_VECTOR (3 downto 0));
end command;

architecture Behavioral of command is

component falling_edge_button is
    Port ( CLK : in  STD_LOGIC;
           BT : in  STD_LOGIC;
           state : out  STD_LOGIC);
end component;

TYPE state_type IS (A, B, C);
signal st : state_type ;
signal X1 : STD_LOGIC;
signal X2 : STD_LOGIC;
begin



--Active state button is '0'
process(CLK)
begin
	if(CLK'event and CLK = '1') then

		case st is
				when A =>	
					if X2 = '1' then
						st <= A;
					elsif X1 = '1' then
						st <=B;
					end if;
				when B =>	
					if X2 = '1' then
						st <= A;
					elsif X1 = '1' then
						st <=C;
					end if;
				when C =>	
					if X2 = '1' then
						st <= A;
					elsif X1 = '1' then
						st <=B;
					end if;
		end case;
	end if;
	if (hun="1001") and (tenth="1001") and (unit="1001") and (ten="1001") then
		st <= A;
	end if;
end process;

process(st)
begin

	case st is
		when A =>	reset <= '1';
						stop <= '1';
		when B =>	reset <= '0';
						stop <= '0';
		when C =>	reset <= '0';
						stop <= '1';
	end case;

end process;

StateBT1 : falling_edge_button port map (CLK, BT1, X1);
StateBT2 : falling_edge_button port map (CLK, BT2, X2);

end Behavioral;

