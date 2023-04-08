----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:14 01/17/2023 
-- Design Name: 
-- Module Name:    increase - Behavioral 
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

entity increase is
    Port ( CLK : in  STD_LOGIC;
           reset : inout  STD_LOGIC;
           stop : in  STD_LOGIC;
           hun : inout  STD_LOGIC_VECTOR (3 downto 0);
           tenth : inout  STD_LOGIC_VECTOR (3 downto 0);
           uni : inout  STD_LOGIC_VECTOR (3 downto 0);
           ten : inout  STD_LOGIC_VECTOR (3 downto 0));
end increase;

architecture Behavioral of increase is

begin
-- reset when '1' 	stop when '0' ( priority on reset)
process(CLK)
begin
	if(CLK'event and CLK = '1') then
		if(reset = '1') then
			hun <= "0000";
			tenth <= "0000";
			uni <= "0000";
			ten <= "0000";
			
		elsif(stop = '0') then
			if(hun = "1001") then
				hun <= "0000";
				tenth <= tenth +1;

				if tenth = "1001" then
					uni <= uni + 1;
					tenth <= "0000";

					if uni = "1001" then
						ten <= ten + 1;
						uni <= "0000";

						if ten = "1001" then --rolls over when it gets to 99.99
							--hun <= "0000";
							--tenth <= "0000";
							--uni <= "0000";
							--ten <= "0000";
							--fullTime <= '1';
						end if;
					end if;
				end if;
				
			else
				hun <= hun + 1;
			end if;
		end if;
	end if;
end process;


end Behavioral;

