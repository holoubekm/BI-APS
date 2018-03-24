--- Hazard_control 
--selB<="00";
--selA<="00";
--IF_stall<='0';
--ID_stall<='0';
--ID_clear<='0';
--EX_stall<='0';
--EX_clear<='0';
--MEM_stall<='0';
--MEM_clear<='0';
--WB_stall<='0';
--WB_clear<='0';


--Instruction(31 downto 26) "001100"
--lw rw = EX_IR(20 downto 16)
--addi ra = EX_IR(25 downto 21)


--(EX_IR(31 downto 26)="000010")

--WHEN "00" => EX_busA_FW <= EX_busA;
--WHEN "01" => EX_busA_FW <= MEM_S;
--WHEN "10" => EX_busA_FW <= WB_M;

selA <= "01" WHEN
	((MEM_IR(31 downto 26)="000000" and MEM_IR(5 downto 3)="100") or (MEM_IR(31 downto 26)>="001000" and MEM_IR(31 downto 26)<="001111"))
	and
	(MEM_Rw=EX_Ra and EX_Ra/="0000")
ELSE "10" WHEN
	(WB_load='1' and WB_Rw=EX_Ra) or 
	(((WB_IR(31 downto 26)="000000" and WB_IR(5 downto 3)="100") or (WB_IR(31 downto 26)>="001000" and WB_IR(31 downto 26)<="001111"))
		and
	(WB_Rw=EX_Ra and EX_Ra/="0000"))
ELSE "00";

selB <= "01" WHEN
	((MEM_IR(31 downto 26)="000000" and MEM_IR(5 downto 3)="100") or (MEM_IR(31 downto 26)>="001000" and MEM_IR(31 downto 26)<="001111"))
	and
	(MEM_Rw=EX_Rb and EX_Rb/="0000")
ELSE "10" WHEN
	(WB_load='1' and WB_Rw=EX_Rb) or 
	(((WB_IR(31 downto 26)="000000" and WB_IR(5 downto 3)="100") or (WB_IR(31 downto 26)>="001000" and WB_IR(31 downto 26)<="001111"))
		and
	(WB_Rw=EX_Rb and EX_Rb/="0000"))
ELSE "00";

ID_stall<='1' WHEN
	(Jump_now='0' and
		--Two two source registers
		((((ID_IR(31 downto 26)="000000" and ID_IR(5 downto 3)="100") or (ID_IR(31 downto 26)="101011")) and
			(EX_IR(31 downto 26)="100011" and (EX_Rw=ID_Ra or EX_Rw=ID_Rb) and EX_Rw/="0000")) 
		or
		--One source register
		(((ID_IR(31 downto 26)>="001000" and ID_IR(31 downto 26)<="001111") or 
			(ID_IR(31 downto 26)="010010") or 
			(ID_IR(31 downto 26)="010011") or 
			(ID_IR(31 downto 26)="100011") or
			(ID_IR(31 downto 26)="000100") or
			(ID_IR(31 downto 26)="000101")) and
		(EX_IR(31 downto 26)="100011" and (EX_Rw=ID_Ra or EX_Rw=ID_Rb) and EX_Rw/="0000")))
	)
ELSE '0';

IF_stall<=ID_stall;
ID_clear<=Jump_now;
EX_stall<='0';
EX_clear<=ID_stall or Jump_now;
MEM_stall<='0';
MEM_clear<=Jump_now;
WB_stall<='0';
WB_clear<='0';




