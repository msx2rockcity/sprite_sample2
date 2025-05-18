1000           ORG     0D000H
1010           ;
1020           LD      A,15
1030           LD      (0F3E9H),A
1040           LD      A,1
1050           LD      (0F3EAH),A
1060           LD      A,1
1070           LD      (0F3EBH),A
1080           CALL    0072H
1090           ;
1100           LD      B,11100011B
1110           LD      C,1
1120           CALL    0047H
1130           ;
1140           CALL    0069H
1150           LD      HL,SPDAT
1160           LD      DE,3800H
1170           LD      BC,32
1180           CALL    005CH
1190           ;
1200           LD      DE,IDAREA
1210           LD      HL,IDNEW
1220           LD      BC,208
1230           LDIR
1240           ;
1250 NOCHEG:   LD      B,0
1260 LOOP:     LD      A,B
1270           ADD     A,A
1280           ADD     A,A
1290           LD      C,A
1300           ADD     A,A
1310           ADD     A,C
1320           ADD     A,B
1330           LD      IX,IDAREA
1340           LD      E,A
1350           LD      D,0
1360           ADD     IX,DE
1370           DEC     (IX+5)
1380           JR      NZ,JR1
1390           LD      A,(IX+4)
1400           LD      (IX+5),A
1410           CALL    MOVSPT
1420 JR1:      CALL    00B7H
1430           JP      C,RETURN
1440           LD      A,B
1450           INC     B
1460           CP      15
1470           JR      NZ,LOOP
1480           CALL    WAIT
1490           JR      NOCHEG
1500           ;
1510 MOVSPT:   PUSH    BC
1520           LD      A,(IX+6)
1530           OR      A
1540           CALL    Z,DATSET
1550           CALL    MOVE
1560           POP     BC
1570           RET
1580 DATSET:   LD      H,(IX+12)
1590           LD      L,(IX+11)
1600           LD      A,(HL)
1610           OR      A
1620           JR      NZ,JR2
1630           LD      A,(IX+10)
1640           LD      (IX+12),A
1650           LD      A,(IX+9)
1660           LD      (IX+11),A
1670           JR      DATSET
1680 JR2:      LD      (IX+6),A
1690           INC     HL
1700           LD      A,(HL)
1710           LD      (IX+7),A
1720           INC     HL
1730           LD      A,(HL)
1740           LD      (IX+8),A
1750           INC     HL
1760           LD      A,L
1770           LD      (IX+11),A
1780           LD      A,H
1790           LD      (IX+12),A
1800           RET
1810           ;
1820 MOVE:     LD      A,(IX+7)
1830           ADD     A,(IX+0)
1840           LD      (IX+0),A
1850           LD      A,(IX+8)
1860           ADD     A,(IX+1)
1870           LD      (IX+1),A
1880           DEC     (IX+6)
1890           LD      A,B
1900           CALL    0087H
1910           PUSH    IX
1920           POP     DE
1930           EX      DE,HL
1940           LD      BC,4
1950           CALL    005CH
1960           RET
1970           ;
1980 WAIT:     LD      HL,0A01H
1990           DEC     L
2000           JR      NZ,$-1
2010           DEC     H
2020           JR      NZ,$-4
2030           RET
2040           ;
2050 RETURN:   CALL    00D2H
2060           RET
2070           ;
2080 SPDAT:
2090 DEFB      000H,04EH,07FH,07FH
2100 DEFB      043H,03DH,042H,043H
2110 DEFB      042H,03CH,040H,03FH
2120 DEFB      00FH,02FH,01FH,000H
2130 DEFB      060H,0F2H,0FEH,0FEH
2140 DEFB      0C2H,0ACH,042H,0C2H
2150 DEFB      042H,03CH,002H,0FCH
2160 DEFB      0F0H,0F4H,0F8H,000H
2170 IDNEW:
2180 DEFB    000,116,00,14,1,1,0
2190 DEFW    0,MOVDAT,MOVDAT
2200 DEFB    000,140,00,15,1,1,0
2210 DEFW    0,MOVDAT,MOVDAT+3
2220 DEFB    012,164,00,14,1,1,0
2230 DEFW    0,MOVDAT,MOVDAT+6
2240 DEFB    036,188,00,15,1,1,0
2250 DEFW    0,MOVDAT,MOVDAT+9
2260 DEFB    060,200,00,14,1,1,0
2270 DEFW    0,MOVDAT,MOVDAT+12
2280 DEFB    084,200,00,15,1,1,0
2290 DEFW    0,MOVDAT,MOVDAT+15
2300 DEFB    108,188,00,14,1,1,0
2310 DEFW    0,MOVDAT,MOVDAT+18
2320 DEFB    132,164,00,15,1,1,0
2330 DEFW    0,MOVDAT,MOVDAT+21
2340 DEFB    144,140,00,14,1,1,0
2350 DEFW    0,MOVDAT,MOVDAT+24
2360 DEFB    144,116,00,15,1,1,0
2370 DEFW    0,MOVDAT,MOVDAT+27
2380 DEFB    132,098,00,14,1,1,0
2390 DEFW    0,MOVDAT,MOVDAT+30
2400 DEFB    108,074,00,15,1,1,0
2410 DEFW    0,MOVDAT,MOVDAT+33
2420 DEFB    084,062,00,14,1,1,0
2430 DEFW    0,MOVDAT,MOVDAT+36
2440 DEFB    060,062,00,15,1,1,0
2450 DEFW    0,MOVDAT,MOVDAT+39
2451 DEFB    036,074,00,14,1,1,0
2452 DEFW    0,MOVDAT,MOVDAT+42
2453 DEFB    012,098,00,15,1,1,0
2454 DEFW    0,MOVDAT,MOVDAT+45
2455 MOVDAT:
2460 DEFB    12,0,2,12,1,2,12,2,2,12,2,1,12,2,0,12,2,-1,12,2,-2,12,1,-2,12
2465 DEFB    0,-2,12,-1,-2,12,-2,-2,12,-2,-1,12,-2,0,12,-2,1,12,-2,2,12,-1,2,0
2520 IDAREA:   DEFS    208
