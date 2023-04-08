----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:34:47 12/20/2022 
-- Design Name: 
-- Module Name:    main - Behavioral 
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
use IEEE.numeric_std;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( BT1 : in  STD_LOGIC;
           BT2 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           SEG : out  STD_LOGIC_VECTOR (7 downto 0);
           base : out  STD_LOGIC_VECTOR (3 downto 0));
end main;

architecture Behavioral of main is

component display is
    Port ( CLK : in  STD_LOGIC;
           hun : in  STD_LOGIC_VECTOR (3 downto 0);
           tenth : in  STD_LOGIC_VECTOR (3 downto 0);
           unit : in  STD_LOGIC_VECTOR (3 downto 0);
           ten : in  STD_LOGIC_VECTOR (3 downto 0);
           SEG : out  STD_LOGIC_VECTOR (7 downto 0);
           base : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component divider is
    Port ( CLK : in  STD_LOGIC;
           CLK_500 : inout  STD_LOGIC;
           CLK_100 : out  STD_LOGIC);
end component;

component increase is
    Port ( CLK : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           hun : inout  STD_LOGIC_VECTOR (3 downto 0);
           tenth : inout  STD_LOGIC_VECTOR (3 downto 0);
           uni : inout  STD_LOGIC_VECTOR (3 downto 0);
           ten : inout  STD_LOGIC_VECTOR (3 downto 0));
end component;

component command is
    Port ( BT1 : in  STD_LOGIC;--stop
           BT2 : in  STD_LOGIC;--reset
           reset : out  STD_LOGIC;
           stop : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  hun : in  STD_LOGIC_VECTOR (3 downto 0);
           tenth : in  STD_LOGIC_VECTOR (3 downto 0);
           unit : in  STD_LOGIC_VECTOR (3 downto 0);
           ten : in  STD_LOGIC_VECTOR (3 downto 0));
end component;


signal hundredth :  STD_LOGIC_VECTOR (3 downto 0);
signal tenth :  STD_LOGIC_VECTOR (3 downto 0);
signal unity :  STD_LOGIC_VECTOR (3 downto 0);
signal ten :  STD_LOGIC_VECTOR (3 downto 0);
signal CLK_500hz: STD_LOGIC;
signal CLK_100hz: STD_LOGIC;

signal reset : STD_LOGIC;
signal stop: STD_LOGIC;

begin


Cincr : increase port map (CLK_100hz, reset, stop, hundredth, tenth, unity, ten);
Cdisp : display port map(CLK_500hz , hundredth, tenth, unity, ten, SEG, base);
Cdiv : divider port map(CLK, CLK_500hz, CLK_100hz);
Ccommand : command port map (BT1, BT2, reset, stop, CLK_100hz, hundredth, tenth, unity, ten);



end Behavioral;

