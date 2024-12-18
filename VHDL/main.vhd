library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
    port (
        clk : in STD_LOGIC;
        en : in STD_LOGIC;
        challenge : in STD_LOGIC_VECTOR(3 downto 0);
        count_test : out STD_LOGIC_VECTOR(9 downto 0);
        counter_alarm1, counter_alarm2, comparator1, comparator2, comparator3, comparator4 : out STD_LOGIC
    );
end main;

architecture Behavioral of main is
    signal lock1, lock2, lock3, lock4, lock5, lock6, lock7, lock8 : STD_LOGIC := '0';
    signal count1, count2, count3, count4, count5, count6, count7, count8 : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal osc_counter1, osc_counter2, osc_counter3, osc_counter4, osc_counter5, osc_counter6, osc_counter7, osc_counter8, osc1, osc2, osc3, osc4, osc5, osc6, osc7, osc8, osc9, osc10, osc11, osc12, osc13, osc14, osc15, osc16, osc17, osc18, osc19, osc20, osc21, osc22, osc23, osc24, osc25, osc26, osc27, osc28, osc29, osc30, osc31, osc32, osc33, osc34, osc35, osc36, osc37, osc38, osc39, osc40, osc41, osc42, osc43, osc44, osc45, osc46, osc47, osc48, osc49, osc50, osc51, osc52, osc53, osc54, osc55, osc56, osc57, osc58, osc59, osc60, osc61, osc62, osc63, osc64, osc65, osc66, osc67, osc68, osc69, osc70, osc71, osc72, osc73, osc74, osc75, osc76, osc77, osc78, osc79, osc80, osc81, osc82, osc83, osc84, osc85, osc86, osc87, osc88, osc89, osc90, osc91, osc92, osc93, osc94, osc95, osc96, osc97, osc98, osc99, osc100, osc101, osc102, osc103, osc104, osc105, osc106, osc107, osc108, osc109, osc110, osc111, osc112, osc113, osc114, osc115, osc116, osc117, osc118, osc119, osc120, osc121, osc122, osc123, osc124, osc125, osc126, osc127, osc128 : STD_LOGIC;

    component ROF1
        port ( -- Clock in ports
            en : in std_logic;
            osc : out std_logic
        );
    end component;

    component ROF2
        port ( -- Clock in ports
            en : in std_logic;
            osc : out std_logic
        );
    end component;

    component ROF3
        port ( -- Clock in ports
            en : in std_logic;
            osc : out std_logic
        );
    end component;
    
    component ROF4
        port ( -- Clock in ports
            en : in std_logic;
            osc : out std_logic
        );
    end component;

    component counter
        port (
            clk         : in STD_LOGIC;
            enable      : in  STD_LOGIC;
            osc_comein  : in STD_LOGIC;
            challenge   : in STD_LOGIC_VECTOR(3 downto 0);
            lock        : inout STD_LOGIC;
            count       : inout STD_LOGIC_VECTOR(9 downto 0)
        );
    end component;
begin
-------------------First group with f1 frequency (x10)---------------
    RO1 : ROF1 port map (en => en, osc => osc1);
    RO2 : ROF1 port map (en => en, osc => osc2);
    RO3 : ROF1 port map (en => en, osc => osc3);
    RO4 : ROF1 port map (en => en, osc => osc4);
    RO5 : ROF1 port map (en => en, osc => osc5);
    RO6 : ROF1 port map (en => en, osc => osc6);
    RO7 : ROF1 port map (en => en, osc => osc7);
    RO8 : ROF1 port map (en => en, osc => osc8);
    RO9 : ROF1 port map (en => en, osc => osc9);
    RO10 : ROF1 port map (en => en, osc => osc10);
    RO11 : ROF1 port map (en => en, osc => osc11);
    RO12 : ROF1 port map (en => en, osc => osc12);
    RO13 : ROF1 port map (en => en, osc => osc13);
    RO14 : ROF1 port map (en => en, osc => osc14);
    RO15 : ROF1 port map (en => en, osc => osc15);
    RO16 : ROF1 port map (en => en, osc => osc16);
    RO17 : ROF1 port map (en => en, osc => osc17);
    RO18 : ROF1 port map (en => en, osc => osc18);
    RO19 : ROF1 port map (en => en, osc => osc19);
    RO20 : ROF1 port map (en => en, osc => osc20);
    RO21 : ROF1 port map (en => en, osc => osc21);
    RO22 : ROF1 port map (en => en, osc => osc22);
    RO23 : ROF1 port map (en => en, osc => osc23);
    RO24 : ROF1 port map (en => en, osc => osc24);
    RO25 : ROF1 port map (en => en, osc => osc25);
    RO26 : ROF1 port map (en => en, osc => osc26);
    RO27 : ROF1 port map (en => en, osc => osc27);
    RO28 : ROF1 port map (en => en, osc => osc28);
    RO29 : ROF1 port map (en => en, osc => osc29);
    RO30 : ROF1 port map (en => en, osc => osc30);
    RO31 : ROF1 port map (en => en, osc => osc31);
    RO32 : ROF1 port map (en => en, osc => osc32);
-------------------Seccond group with f2 frequency (x10)-------------
    RO33 : ROF2 port map (en => en, osc => osc33);
    RO34 : ROF2 port map (en => en, osc => osc34);
    RO35 : ROF2 port map (en => en, osc => osc35);
    RO36 : ROF2 port map (en => en, osc => osc36);
    RO37 : ROF2 port map (en => en, osc => osc37);
    RO38 : ROF2 port map (en => en, osc => osc38);
    RO39 : ROF2 port map (en => en, osc => osc39);
    RO40 : ROF2 port map (en => en, osc => osc40);
    RO41 : ROF2 port map (en => en, osc => osc41);
    RO42 : ROF2 port map (en => en, osc => osc42);
    RO43 : ROF2 port map (en => en, osc => osc43);
    RO44 : ROF2 port map (en => en, osc => osc44);
    RO45 : ROF2 port map (en => en, osc => osc45);
    RO46 : ROF2 port map (en => en, osc => osc46);
    RO47 : ROF2 port map (en => en, osc => osc47);
    RO48 : ROF2 port map (en => en, osc => osc48);
    RO49 : ROF2 port map (en => en, osc => osc49);
    RO50 : ROF2 port map (en => en, osc => osc50);
    RO51 : ROF2 port map (en => en, osc => osc51);
    RO52 : ROF2 port map (en => en, osc => osc52);
    RO53 : ROF2 port map (en => en, osc => osc53);
    RO54 : ROF2 port map (en => en, osc => osc54);
    RO55 : ROF2 port map (en => en, osc => osc55);
    RO56 : ROF2 port map (en => en, osc => osc56);
    RO57 : ROF2 port map (en => en, osc => osc57);
    RO58 : ROF2 port map (en => en, osc => osc58);
    RO59 : ROF2 port map (en => en, osc => osc59);
    RO60 : ROF2 port map (en => en, osc => osc60);
    RO61 : ROF2 port map (en => en, osc => osc61);
    RO62 : ROF2 port map (en => en, osc => osc62);
    RO63 : ROF2 port map (en => en, osc => osc63);
    RO64 : ROF2 port map (en => en, osc => osc64);
-------------------Third group with f3 frequency (x10)---------------
    RO65 : ROF3 port map (en => en, osc => osc65);
    RO66 : ROF3 port map (en => en, osc => osc66);
    RO67 : ROF3 port map (en => en, osc => osc67);
    RO68 : ROF3 port map (en => en, osc => osc68);
    RO69 : ROF3 port map (en => en, osc => osc69);
    RO70 : ROF3 port map (en => en, osc => osc70);
    RO71 : ROF3 port map (en => en, osc => osc71);
    RO72 : ROF3 port map (en => en, osc => osc72);
    RO73 : ROF3 port map (en => en, osc => osc73);
    RO74 : ROF3 port map (en => en, osc => osc74);
    RO75 : ROF3 port map (en => en, osc => osc75);
    RO76 : ROF3 port map (en => en, osc => osc76);
    RO77 : ROF3 port map (en => en, osc => osc77);
    RO78 : ROF3 port map (en => en, osc => osc78);
    RO79 : ROF3 port map (en => en, osc => osc79);
    RO80 : ROF3 port map (en => en, osc => osc80);
    RO81 : ROF3 port map (en => en, osc => osc81);
    RO82 : ROF3 port map (en => en, osc => osc82);
    RO83 : ROF3 port map (en => en, osc => osc83);
    RO84 : ROF3 port map (en => en, osc => osc84);
    RO85 : ROF3 port map (en => en, osc => osc85);
    RO86 : ROF3 port map (en => en, osc => osc86);
    RO87 : ROF3 port map (en => en, osc => osc87);
    RO88 : ROF3 port map (en => en, osc => osc88);
    RO89 : ROF3 port map (en => en, osc => osc89);
    RO90 : ROF3 port map (en => en, osc => osc90);
    RO91 : ROF3 port map (en => en, osc => osc91);
    RO92 : ROF3 port map (en => en, osc => osc92);
    RO93 : ROF3 port map (en => en, osc => osc93);
    RO94 : ROF3 port map (en => en, osc => osc94);
    RO95 : ROF3 port map (en => en, osc => osc95);
    RO96 : ROF3 port map (en => en, osc => osc96);
-------------------Fourth group with f4 frequency (x10)---------------
    RO97 : ROF4 port map (en => en, osc => osc97);
    RO98 : ROF4 port map (en => en, osc => osc98);
    RO99 : ROF4 port map (en => en, osc => osc99);
    RO100 : ROF4 port map (en => en, osc => osc100);
    RO101 : ROF4 port map (en => en, osc => osc101);
    RO102 : ROF4 port map (en => en, osc => osc102);
    RO103 : ROF4 port map (en => en, osc => osc103);
    RO104 : ROF4 port map (en => en, osc => osc104);
    RO105 : ROF4 port map (en => en, osc => osc105);
    RO106 : ROF4 port map (en => en, osc => osc106);
    RO107 : ROF4 port map (en => en, osc => osc107);
    RO108 : ROF4 port map (en => en, osc => osc108);
    RO109 : ROF4 port map (en => en, osc => osc109);
    RO110 : ROF4 port map (en => en, osc => osc110);
    RO111 : ROF4 port map (en => en, osc => osc111);
    RO112 : ROF4 port map (en => en, osc => osc112);
    RO113 : ROF4 port map (en => en, osc => osc113);
    RO114 : ROF4 port map (en => en, osc => osc114);
    RO115 : ROF4 port map (en => en, osc => osc115);
    RO116 : ROF4 port map (en => en, osc => osc116);
    RO117 : ROF4 port map (en => en, osc => osc117);
    RO118 : ROF4 port map (en => en, osc => osc118);
    RO119 : ROF4 port map (en => en, osc => osc119);
    RO120 : ROF4 port map (en => en, osc => osc120);
    RO121 : ROF4 port map (en => en, osc => osc121);
    RO122 : ROF4 port map (en => en, osc => osc122);
    RO123 : ROF4 port map (en => en, osc => osc123);
    RO124 : ROF4 port map (en => en, osc => osc124);
    RO125 : ROF4 port map (en => en, osc => osc125);
    RO126 : ROF4 port map (en => en, osc => osc126);
    RO127 : ROF4 port map (en => en, osc => osc127);
    RO128 : ROF4 port map (en => en, osc => osc128);

    process(challenge)
    begin
        case challenge is
            when "0000" => osc_counter1 <= osc1;  osc_counter2 <= osc17;  osc_counter3 <= osc33;  osc_counter4 <= osc49;  osc_counter5 <= osc65;  osc_counter6 <= osc81;  osc_counter7 <= osc97;  osc_counter8 <= osc113;
            when "0001" => osc_counter1 <= osc2;  osc_counter2 <= osc18;  osc_counter3 <= osc34;  osc_counter4 <= osc50;  osc_counter5 <= osc66;  osc_counter6 <= osc82;  osc_counter7 <= osc98;  osc_counter8 <= osc114;
            when "0010" => osc_counter1 <= osc3;  osc_counter2 <= osc19;  osc_counter3 <= osc35;  osc_counter4 <= osc51;  osc_counter5 <= osc67;  osc_counter6 <= osc83;  osc_counter7 <= osc99;  osc_counter8 <= osc115;
            when "0011" => osc_counter1 <= osc4;  osc_counter2 <= osc20;  osc_counter3 <= osc36;  osc_counter4 <= osc52;  osc_counter5 <= osc68;  osc_counter6 <= osc84;  osc_counter7 <= osc100; osc_counter8 <= osc116;
            when "0100" => osc_counter1 <= osc5;  osc_counter2 <= osc21;  osc_counter3 <= osc37;  osc_counter4 <= osc53;  osc_counter5 <= osc69;  osc_counter6 <= osc85;  osc_counter7 <= osc101; osc_counter8 <= osc117;
            when "0101" => osc_counter1 <= osc6;  osc_counter2 <= osc22;  osc_counter3 <= osc38;  osc_counter4 <= osc54;  osc_counter5 <= osc70;  osc_counter6 <= osc86;  osc_counter7 <= osc102; osc_counter8 <= osc118;
            when "0110" => osc_counter1 <= osc7;  osc_counter2 <= osc23;  osc_counter3 <= osc39;  osc_counter4 <= osc55;  osc_counter5 <= osc71;  osc_counter6 <= osc87;  osc_counter7 <= osc103; osc_counter8 <= osc119;
            when "0111" => osc_counter1 <= osc8;  osc_counter2 <= osc24;  osc_counter3 <= osc40;  osc_counter4 <= osc56;  osc_counter5 <= osc72;  osc_counter6 <= osc88;  osc_counter7 <= osc104; osc_counter8 <= osc120;
            when "1000" => osc_counter1 <= osc9;  osc_counter2 <= osc25;  osc_counter3 <= osc41;  osc_counter4 <= osc57;  osc_counter5 <= osc73;  osc_counter6 <= osc89;  osc_counter7 <= osc105; osc_counter8 <= osc121;
            when "1001" => osc_counter1 <= osc10; osc_counter2 <= osc26;  osc_counter3 <= osc42;  osc_counter4 <= osc58;  osc_counter5 <= osc74;  osc_counter6 <= osc90;  osc_counter7 <= osc106; osc_counter8 <= osc122;
            when "1010" => osc_counter1 <= osc11; osc_counter2 <= osc27;  osc_counter3 <= osc43;  osc_counter4 <= osc59;  osc_counter5 <= osc75;  osc_counter6 <= osc91;  osc_counter7 <= osc107; osc_counter8 <= osc123;
            when "1011" => osc_counter1 <= osc12; osc_counter2 <= osc28;  osc_counter3 <= osc44;  osc_counter4 <= osc60;  osc_counter5 <= osc76;  osc_counter6 <= osc92;  osc_counter7 <= osc108; osc_counter8 <= osc124;
            when "1100" => osc_counter1 <= osc13; osc_counter2 <= osc29;  osc_counter3 <= osc45;  osc_counter4 <= osc61;  osc_counter5 <= osc77;  osc_counter6 <= osc93;  osc_counter7 <= osc109; osc_counter8 <= osc125;
            when "1101" => osc_counter1 <= osc14; osc_counter2 <= osc30;  osc_counter3 <= osc46;  osc_counter4 <= osc62;  osc_counter5 <= osc78;  osc_counter6 <= osc94;  osc_counter7 <= osc110; osc_counter8 <= osc126;
            when "1110" => osc_counter1 <= osc15; osc_counter2 <= osc31;  osc_counter3 <= osc47;  osc_counter4 <= osc63;  osc_counter5 <= osc79;  osc_counter6 <= osc95;  osc_counter7 <= osc111; osc_counter8 <= osc127;
            when "1111" => osc_counter1 <= osc16; osc_counter2 <= osc32;  osc_counter3 <= osc48;  osc_counter4 <= osc64;  osc_counter5 <= osc80;  osc_counter6 <= osc96;  osc_counter7 <= osc112; osc_counter8 <= osc128;
            when others => null;
        end case;
    end process;
    
    COUNTER1 : counter port map (clk => clk, enable => en, osc_comein => osc_counter1, challenge => challenge, lock => lock1, count => count1);
    COUNTER2 : counter port map (clk => clk, enable => en, osc_comein => osc_counter2, challenge => challenge, lock => lock2, count => count2);
    COUNTER3 : counter port map (clk => clk, enable => en, osc_comein => osc_counter3, challenge => challenge, lock => lock3, count => count3);
    COUNTER4 : counter port map (clk => clk, enable => en, osc_comein => osc_counter4, challenge => challenge, lock => lock4, count => count4);
    COUNTER5 : counter port map (clk => clk, enable => en, osc_comein => osc_counter5, challenge => challenge, lock => lock5, count => count5);
    COUNTER6 : counter port map (clk => clk, enable => en, osc_comein => osc_counter6, challenge => challenge, lock => lock6, count => count6);
    COUNTER7 : counter port map (clk => clk, enable => en, osc_comein => osc_counter7, challenge => challenge, lock => lock7, count => count7);
    COUNTER8 : counter port map (clk => clk, enable => en, osc_comein => osc_counter8, challenge => challenge, lock => lock8, count => count8);
    comparator1 <= '1' when unsigned(count1) > unsigned(count2) else '0';
    comparator2 <= '1' when unsigned(count3) > unsigned(count4) else '0';
    comparator3 <= '1' when unsigned(count5) > unsigned(count6) else '0';
    comparator4 <= '1' when unsigned(count7) > unsigned(count8) else '0';
    counter_alarm1 <= '1' when unsigned(count1) = unsigned(count2) or unsigned(count3) = unsigned(count4) or unsigned(count5) = unsigned(count6) or unsigned(count7) = unsigned(count8) else '0';
    counter_alarm2 <= '1' when unsigned(count1) = 0 or unsigned(count2) = 0 or unsigned(count3) = 0 or unsigned(count4) = 0 or unsigned(count5) = 0 or unsigned(count6) = 0 or unsigned(count7) = 0 or unsigned(count8) = 0 else '0';
    count_test <= count1;

end Behavioral;