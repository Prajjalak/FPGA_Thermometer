library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity temperature_RS232 is
   port ( CLOCK_50 : in    std_logic; 
          disp_rst : in    std_logic; 
          uart_rst : in    std_logic; 
          RX       : in    std_logic; 
          FF_rst   : in    std_logic; 
          RX_empty : out   std_logic; 
          r_data   : out   std_logic_vector (7 downto 0); 
          SEG7_SEG : out   std_logic_vector (7 downto 0); 
          SEG7_SEL : out   std_logic_vector (3 downto 0); 
          TX       : out   std_logic; 
          TX_full  : out   std_logic; 
          DS18B20  : inout std_logic);
end temperature_RS232;

architecture BEHAVIORAL of temperature_RS232 is
   signal W_12                   : std_logic_vector (7 downto 0);
   signal W_23                   : std_logic;
   signal W_2_rd_uart_openSignal : std_logic;
   component ds18b20_seg7
      port ( CLOCK_50   : in    std_logic; 
             Q_KEY      : in    std_logic; 
             DS18B20    : inout std_logic; 
             SEG7_SEG   : out   std_logic_vector (7 downto 0); 
             SEG7_SEL   : out   std_logic_vector (3 downto 0); 
             data_to_pc : out   std_logic_vector (7 downto 0));
   end component;
   
   component uart
      port ( clk      : in    std_logic; 
             reset    : in    std_logic; 
             rd_uart  : in    std_logic; 
             wr_uart  : in    std_logic; 
             rx       : in    std_logic; 
             w_data   : in    std_logic_vector (7 downto 0); 
             tx_full  : out   std_logic; 
             rx_empty : out   std_logic; 
             tx       : out   std_logic; 
             r_data   : out   std_logic_vector (7 downto 0));
   end component;
   
   component T_FlipFlop
      port ( reset : in    std_logic; 
             CLK   : in    std_logic; 
             q     : inout std_logic; 
             qnot  : inout std_logic);
   end component;
   
begin
   U1 : ds18b20_seg7
      port map (CLOCK_50=>CLOCK_50,
                Q_KEY=>disp_rst,
                data_to_pc(7 downto 0)=>W_12(7 downto 0),
                SEG7_SEG(7 downto 0)=>SEG7_SEG(7 downto 0),
                SEG7_SEL(3 downto 0)=>SEG7_SEL(3 downto 0),
                DS18B20=>DS18B20);
   
   U2 : uart
      port map (clk=>CLOCK_50,
                rd_uart=>W_2_rd_uart_openSignal,
                reset=>uart_rst,
                rx=>RX,
                wr_uart=>W_23,
                w_data(7 downto 0)=>W_12(7 downto 0),
                rx_empty=>RX_empty,
                r_data(7 downto 0)=>r_data(7 downto 0),
                tx=>TX,
                tx_full=>TX_full);
   
   U3 : T_FlipFlop
      port map (CLK=>CLOCK_50,
                reset=>FF_rst,
                q=>W_23,
                qnot=>open);
   
end BEHAVIORAL;