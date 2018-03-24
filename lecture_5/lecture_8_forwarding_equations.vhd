--- Hazard_control 
--IF_stall<='0';
--ID_stall<=not(ID_stall);
--ID_clear<='1';
--EX_stall<='0';
--EX_clear<='0';
--MEM_stall<='0';
--MEM_clear<='0';
--WB_stall<='0';
--WB_clear<='0';


--Instruction(31 downto 26) "001100"
--lw rw = EX_IR(20 downto 16)
--addi ra = EX_IR(25 downto 21)
IF_stall<='1' WHEN 
	--register type or store
	--destination instruction
	(Jump_now='0' and
	(
		(
			((Instruction(31 downto 26)="000000" and Instruction(5 downto 3)="100") or (Instruction(31 downto 26)="101011"))
			and
				(((ID_IR(31 downto 26)="000000" and ID_IR(5 downto 3)="100") and
					((Instruction(25 downto 21)=ID_IR(15 downto 11)) or
					(Instruction(20 downto 16)=ID_IR(15 downto 11)))) or
				((EX_IR(31 downto 26)="000000" and EX_IR(5 downto 3)="100") and
					((Instruction(25 downto 21)=EX_IR(15 downto 11)) or
					(Instruction(20 downto 16)=EX_IR(15 downto 11)))) or
				((ID_IR(31 downto 26)>="001000" and ID_IR(31 downto 26)<="001111") and
					((Instruction(25 downto 21)=ID_IR(20 downto 16)) or
					(Instruction(20 downto 16)=ID_IR(20 downto 16)))) or
				((EX_IR(31 downto 26)>="001000" and EX_IR(31 downto 26)<="001111") and
					((Instruction(25 downto 21)=EX_IR(20 downto 16)) or
					(Instruction(20 downto 16)=EX_IR(20 downto 16)))) or
				((ID_IR(31 downto 26)="100011") and
					((Instruction(25 downto 21)=ID_IR(20 downto 16)) or
					(Instruction(20 downto 16)=ID_IR(20 downto 16)))) or
				((EX_IR(31 downto 26)="100011") and
					((Instruction(25 downto 21)=EX_IR(20 downto 16)) or
					(Instruction(20 downto 16)=EX_IR(20 downto 16)))))
		) 
			or
		(
			((Instruction(31 downto 26)>="001000" and Instruction(31 downto 26)<="001111") or 
			(Instruction(31 downto 26)="010010") or 
			(Instruction(31 downto 26)="010011") or 
			(Instruction(31 downto 26)="100011") or
			(Instruction(31 downto 26)="000100") or
			(Instruction(31 downto 26)="000101"))
			and
				(((ID_IR(31 downto 26)="000000" and ID_IR(5 downto 3)="100") and
					((Instruction(25 downto 21)=ID_IR(15 downto 11)))) or
				((EX_IR(31 downto 26)="000000" and EX_IR(5 downto 3)="100") and
					((Instruction(25 downto 21)=EX_IR(15 downto 11)))) or
				((ID_IR(31 downto 26)>="001000" and ID_IR(31 downto 26)<="001111") and
					((Instruction(25 downto 21)=ID_IR(20 downto 16)))) or
				((EX_IR(31 downto 26)>="001000" and EX_IR(31 downto 26)<="001111") and
					((Instruction(25 downto 21)=EX_IR(20 downto 16)))) or
				((ID_IR(31 downto 26)="100011") and
					((Instruction(25 downto 21)=ID_IR(20 downto 16)))) or
				((EX_IR(31 downto 26)="100011") and
					((Instruction(25 downto 21)=EX_IR(20 downto 16)))))
		)
	))
ELSE '0';

--(EX_IR(31 downto 26)="000010")

ID_stall<='0';
ID_clear<='1' WHEN
	IF_stall='1' or 
	-- J
	(ID_IR(31 downto 26)="000010") or
	(EX_IR(31 downto 26)="000010") or
	(MEM_IR(31 downto 26)="000010") or
	--JAL
	(ID_IR(31 downto 26)="000011") or
	(EX_IR(31 downto 26)="000011") or
	(MEM_IR(31 downto 26)="000011") or
	--JR
	(ID_IR(31 downto 26)="010010") or
	(EX_IR(31 downto 26)="010010") or
	(MEM_IR(31 downto 26)="010010") or
	--JALR
	(ID_IR(31 downto 26)="010011") or
	(EX_IR(31 downto 26)="010011") or
	(MEM_IR(31 downto 26)="010011") or
	--BEQZ
	(EX_IR(31 downto 26)="000100" and EX_busA="00000000") or
	--BNEZ
	(EX_IR(31 downto 26)="000101" and EX_busA/="00000000")
ELSE '0';

EX_stall<='0';
EX_clear<='1' WHEN
	--BEQZ
	((EX_IR(31 downto 26)="000100" and EX_busA="00000000") or
	--BNEZ
	(EX_IR(31 downto 26)="000101" and EX_busA/="00000000"))
ELSE '0';

MEM_stall<='0';
MEM_clear<='0';
WB_stall<='0';
WB_clear<='0';



















