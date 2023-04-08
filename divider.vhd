----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:18:23 01/17/2023 
-- Design Name: 
-- Module Name:    divider - Behavioral 
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

entity divider is
    Port ( CLK : in  STD_LOGIC;
           CLK_500 : inout  STD_LOGIC;
           CLK_100 : out  STD_LOGIC);
end divider;

architecture Behavioral of divider is
signal compt : integer;
signal compt2 : integer;

begin
process(CLK)
begin
	if(CLK'event and CLK = '1') then
	-- for clock of 500Hz
		if (compt < 50000) then 
			CLK_500 <= '0';
		else
			CLK_500 <= '1';
		end if;
		if(compt = 100000) then -- restart to 0
			compt <= 0;
		else
			compt <= compt + 1;
		end if;
		-- for clock of 100Hz
		if (compt2 < 250000) then 
			CLK_100 <= '0';
		else
			CLK_100 <= '1';
		end if;
		if(compt2 = 500000) then -- restart to 0
			compt2 <= 0;
		else
			compt2 <= compt2 + 1;
		end if;
		
		
			
	end if;
end process;



end Behavioral;

