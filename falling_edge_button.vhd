----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:57 01/18/2023 
-- Design Name: 
-- Module Name:    change_state_button - Behavioral 
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

entity falling_edge_button is
    Port ( CLK : in  STD_LOGIC;
           BT : in  STD_LOGIC;
           state : out  STD_LOGIC);
end falling_edge_button;

architecture Behavioral of falling_edge_button is

TYPE state_type IS (A, B, C);
signal st : state_type ;
begin

process(CLK)
begin
	if(CLK'event and CLK = '1') then

		case st is
				when A =>-- state 1	
					if BT = '0' then
						st <= B;
					elsif BT = '1' then
						st <=A;
					end if;
				when B =>-- falling edge	
					if BT = '1' then
						st <= A;
					elsif BT = '0' then
						st <=C;
					end if;
				when C =>-- state 0	
					if BT = '1' then
						st <= A;
					elsif BT = '0' then
						st <=C;
					end if;
		end case;
	end if;
end process;


process(st)
begin

	case st is
		when B =>		state <= '1';--falling edge
		when others => state <= '0';

	end case;

end process;

end Behavioral;

