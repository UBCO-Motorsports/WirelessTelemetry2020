EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 7950 750  0    50   Input ~ 0
Associate\DIO5\AD5
Text GLabel 8050 1150 0    50   Input ~ 0
AD0\DIO0\CommissioningPushbutton
$Comp
L Device:R R1
U 1 1 5DD4642F
P 3150 1000
F 0 "R1" H 3220 1046 50  0000 L CNN
F 1 "100" H 3220 955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3080 1000 50  0001 C CNN
F 3 "~" H 3150 1000 50  0001 C CNN
	1    3150 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5DD49A97
P 3150 1300
F 0 "D2" V 3189 1183 50  0000 R CNN
F 1 "LED" V 3098 1183 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3150 1300 50  0001 C CNN
F 3 "~" H 3150 1300 50  0001 C CNN
	1    3150 1300
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP1 CP3
U 1 1 5DD4FCA2
P 1350 1000
F 0 "CP3" H 1465 1046 50  0000 L CNN
F 1 "10uF" H 1465 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_Elec_4x5.4" H 1350 1000 50  0001 C CNN
F 3 "~" H 1350 1000 50  0001 C CNN
	1    1350 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 850  1350 850 
Connection ~ 1350 850 
Wire Wire Line
	1350 850  1550 850 
Text GLabel 3250 850  2    50   Input ~ 0
Vcc3.3V
Wire Wire Line
	2750 850  3150 850 
Wire Wire Line
	3150 850  3250 850 
$Comp
L Device:R R4
U 1 1 5DD65D11
P 8100 750
F 0 "R4" V 8307 750 50  0000 C CNN
F 1 "100" V 8216 750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8030 750 50  0001 C CNN
F 3 "~" H 8100 750 50  0001 C CNN
	1    8100 750 
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 5DD678C5
P 8400 750
F 0 "D3" H 8393 495 50  0000 C CNN
F 1 "LED" H 8393 586 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8400 750 50  0001 C CNN
F 3 "~" H 8400 750 50  0001 C CNN
	1    8400 750 
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5DD68484
P 8550 750
F 0 "#PWR08" H 8550 500 50  0001 C CNN
F 1 "GND" H 8555 577 50  0000 C CNN
F 2 "" H 8550 750 50  0001 C CNN
F 3 "" H 8550 750 50  0001 C CNN
	1    8550 750 
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5DD6D1CB
P 8250 1150
F 0 "SW1" H 8250 1435 50  0000 C CNN
F 1 "SW_Push" H 8250 1344 50  0000 C CNN
F 2 "Lukas_Library:PTS636 SK25F SMTR LFS" H 8250 1350 50  0001 C CNN
F 3 "~" H 8250 1350 50  0001 C CNN
	1    8250 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5DD6DD18
P 8450 1150
F 0 "#PWR07" H 8450 900 50  0001 C CNN
F 1 "GND" H 8455 977 50  0000 C CNN
F 2 "" H 8450 1150 50  0001 C CNN
F 3 "" H 8450 1150 50  0001 C CNN
	1    8450 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DD48B04
P 4250 2300
F 0 "R2" H 4320 2346 50  0000 L CNN
F 1 "10k" H 4320 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4180 2300 50  0001 C CNN
F 3 "~" H 4250 2300 50  0001 C CNN
	1    4250 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5DD49547
P 4250 3200
F 0 "R3" H 4320 3246 50  0000 L CNN
F 1 "10k" H 4320 3155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4180 3200 50  0001 C CNN
F 3 "~" H 4250 3200 50  0001 C CNN
	1    4250 3200
	1    0    0    -1  
$EndComp
Text GLabel 4100 2450 0    50   Input ~ 0
DOUT
Text GLabel 4100 3350 0    50   Input ~ 0
DIN
Text GLabel 5000 2450 2    50   Input ~ 0
OUT
Text GLabel 5050 3350 2    50   Input ~ 0
IN
Wire Wire Line
	4100 2450 4250 2450
Connection ~ 4250 2450
Wire Wire Line
	4250 2450 4400 2450
Wire Wire Line
	4100 3350 4250 3350
Connection ~ 4250 3350
Wire Wire Line
	4250 3350 4400 3350
Wire Wire Line
	4250 3050 4500 3050
Wire Wire Line
	4250 2150 4500 2150
Wire Wire Line
	5000 2450 4900 2450
Wire Wire Line
	5050 3350 4950 3350
$Comp
L Lukas_Library:ControllerBoardV1 U2
U 1 1 5DD490B1
P 6050 2850
F 0 "U2" H 6300 3815 50  0000 C CNN
F 1 "ControllerBoardV1" H 6300 3724 50  0000 C CNN
F 2 "Lukas_Library:Breadboard_Center_32pin" H 6050 3550 50  0001 C CNN
F 3 "" H 6050 3550 50  0001 C CNN
	1    6050 2850
	1    0    0    -1  
$EndComp
Text GLabel 6950 3700 2    50   Input ~ 0
IN
Text GLabel 6950 3550 2    50   Input ~ 0
OUT
$Comp
L power:GND #PWR04
U 1 1 5DD4A874
P 5650 2350
F 0 "#PWR04" H 5650 2100 50  0001 C CNN
F 1 "GND" H 5655 2177 50  0000 C CNN
F 2 "" H 5650 2350 50  0001 C CNN
F 3 "" H 5650 2350 50  0001 C CNN
	1    5650 2350
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR05
U 1 1 5DD4B3EE
P 5650 2500
F 0 "#PWR05" H 5650 2350 50  0001 C CNN
F 1 "+12V" H 5665 2673 50  0000 C CNN
F 2 "" H 5650 2500 50  0001 C CNN
F 3 "" H 5650 2500 50  0001 C CNN
	1    5650 2500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5DD4BE37
P 6950 4600
F 0 "#PWR06" H 6950 4350 50  0001 C CNN
F 1 "GND" H 6955 4427 50  0000 C CNN
F 2 "" H 6950 4600 50  0001 C CNN
F 3 "" H 6950 4600 50  0001 C CNN
	1    6950 4600
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J1
U 1 1 5DD4D084
P 4750 1350
F 0 "J1" H 4800 1967 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 4800 1876 50  0000 C CNN
F 2 "digikey-footprints:XBEE_PRO-20_THT" H 4750 1350 50  0001 C CNN
F 3 "~" H 4750 1350 50  0001 C CNN
	1    4750 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5DD4FD79
P 4550 1850
F 0 "#PWR03" H 4550 1600 50  0001 C CNN
F 1 "GND" H 4555 1677 50  0000 C CNN
F 2 "" H 4550 1850 50  0001 C CNN
F 3 "" H 4550 1850 50  0001 C CNN
	1    4550 1850
	1    0    0    -1  
$EndComp
Text GLabel 4550 1150 0    50   Input ~ 0
DIN
Text GLabel 4550 1050 0    50   Input ~ 0
DOUT
Text GLabel 4250 950  0    50   Input ~ 0
Vcc3.3V
Text GLabel 5050 1450 2    50   Input ~ 0
Associate\DIO5\AD5
Text GLabel 5050 950  2    50   Input ~ 0
AD0\DIO0\CommissioningPushbutton
NoConn ~ 5050 1050
NoConn ~ 5050 1150
NoConn ~ 5050 1250
NoConn ~ 5050 1350
NoConn ~ 5050 1550
NoConn ~ 5050 1650
NoConn ~ 4800 1600
NoConn ~ 4800 1700
NoConn ~ 4550 1750
NoConn ~ 4550 1650
NoConn ~ 4550 1550
NoConn ~ 4550 1450
NoConn ~ 4550 1350
NoConn ~ 4550 1250
$Comp
L Connector_Generic:Conn_02x06_Counter_Clockwise J2
U 1 1 5DD554F8
P 8100 2400
F 0 "J2" H 8150 2817 50  0000 C CNN
F 1 "Conn_02x06_Counter_Clockwise" H 8150 2726 50  0000 C CNN
F 2 "Lukas_Library:MX120G" H 8100 2400 50  0001 C CNN
F 3 "~" H 8100 2400 50  0001 C CNN
	1    8100 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2350 7900 2350
Wire Wire Line
	7900 2350 7900 2400
Wire Wire Line
	6950 2500 7900 2500
$Comp
L power:+12V #PWR09
U 1 1 5DD57F25
P 7150 2200
F 0 "#PWR09" H 7150 2050 50  0001 C CNN
F 1 "+12V" H 7165 2373 50  0000 C CNN
F 2 "" H 7150 2200 50  0001 C CNN
F 3 "" H 7150 2200 50  0001 C CNN
	1    7150 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5DD5899C
P 7900 2300
F 0 "#PWR010" H 7900 2050 50  0001 C CNN
F 1 "GND" H 7905 2127 50  0000 C CNN
F 2 "" H 7900 2300 50  0001 C CNN
F 3 "" H 7900 2300 50  0001 C CNN
	1    7900 2300
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 5DD5EC26
P 1150 1000
F 0 "C1" H 1265 1046 50  0000 L CNN
F 1 "10nF" H 1265 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1188 850 50  0001 C CNN
F 3 "~" H 1150 1000 50  0001 C CNN
	1    1150 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DD6040D
P 2750 1000
F 0 "C2" H 2865 1046 50  0000 L CNN
F 1 "10nF" H 2865 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2788 850 50  0001 C CNN
F 3 "~" H 2750 1000 50  0001 C CNN
	1    2750 1000
	1    0    0    -1  
$EndComp
Connection ~ 2750 850 
Connection ~ 3150 850 
$Comp
L Device:C C3
U 1 1 5DD6FFB2
P 4400 800
F 0 "C3" H 4515 846 50  0000 L CNN
F 1 "8.2pF" H 4515 755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4438 650 50  0001 C CNN
F 3 "~" H 4400 800 50  0001 C CNN
	1    4400 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5DD70CA7
P 4400 650
F 0 "#PWR011" H 4400 400 50  0001 C CNN
F 1 "GND" H 4405 477 50  0000 C CNN
F 2 "" H 4400 650 50  0001 C CNN
F 3 "" H 4400 650 50  0001 C CNN
	1    4400 650 
	-1   0    0    1   
$EndComp
Wire Wire Line
	4550 950  4400 950 
Connection ~ 4400 950 
Wire Wire Line
	4400 950  4250 950 
NoConn ~ 5050 1750
NoConn ~ 5050 1850
NoConn ~ -600 100 
Connection ~ 2350 850 
Wire Wire Line
	2350 850  2750 850 
Wire Wire Line
	2150 850  2350 850 
$Comp
L power:GND #PWR02
U 1 1 5DD52C1D
P 1850 1150
F 0 "#PWR02" H 1850 900 50  0001 C CNN
F 1 "GND" H 1855 977 50  0000 C CNN
F 2 "" H 1850 1150 50  0001 C CNN
F 3 "" H 1850 1150 50  0001 C CNN
	1    1850 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 CP4
U 1 1 5DD50547
P 2350 1000
F 0 "CP4" H 2465 1046 50  0000 L CNN
F 1 "10uF" H 2465 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_Elec_4x5.4" H 2350 1000 50  0001 C CNN
F 3 "~" H 2350 1000 50  0001 C CNN
	1    2350 1000
	1    0    0    -1  
$EndComp
$Comp
L dk_PMIC-Voltage-Regulators-Linear:LD1117V33 U1
U 1 1 5DD4C875
P 1850 850
F 0 "U1" H 1850 1137 60  0000 C CNN
F 1 "LD1117V33" H 1850 1031 60  0000 C CNN
F 2 "digikey-footprints:SOT-223" H 2050 1050 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 2050 1150 60  0001 L CNN
F 4 "497-1491-5-ND" H 2050 1250 60  0001 L CNN "Digi-Key_PN"
F 5 "LD1117V33" H 2050 1350 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 2050 1450 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 2050 1550 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 2050 1650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/LD1117V33/497-1491-5-ND/586012" H 2050 1750 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 3.3V 800MA TO220AB" H 2050 1850 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 2050 1950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2050 2050 60  0001 L CNN "Status"
	1    1850 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5DD8F1C3
P 2350 1150
F 0 "#PWR0101" H 2350 900 50  0001 C CNN
F 1 "GND" H 2355 977 50  0000 C CNN
F 2 "" H 2350 1150 50  0001 C CNN
F 3 "" H 2350 1150 50  0001 C CNN
	1    2350 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5DD8F461
P 2750 1150
F 0 "#PWR0102" H 2750 900 50  0001 C CNN
F 1 "GND" H 2755 977 50  0000 C CNN
F 2 "" H 2750 1150 50  0001 C CNN
F 3 "" H 2750 1150 50  0001 C CNN
	1    2750 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5DD8F6EF
P 3150 1450
F 0 "#PWR0103" H 3150 1200 50  0001 C CNN
F 1 "GND" H 3155 1277 50  0000 C CNN
F 2 "" H 3150 1450 50  0001 C CNN
F 3 "" H 3150 1450 50  0001 C CNN
	1    3150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5DD8FA41
P 1350 1150
F 0 "#PWR0104" H 1350 900 50  0001 C CNN
F 1 "GND" H 1355 977 50  0000 C CNN
F 2 "" H 1350 1150 50  0001 C CNN
F 3 "" H 1350 1150 50  0001 C CNN
	1    1350 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5DD8FDF8
P 1150 1150
F 0 "#PWR0105" H 1150 900 50  0001 C CNN
F 1 "GND" H 1155 977 50  0000 C CNN
F 2 "" H 1150 1150 50  0001 C CNN
F 3 "" H 1150 1150 50  0001 C CNN
	1    1150 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5DD5AC3A
P 4900 2300
F 0 "R5" H 4970 2346 50  0000 L CNN
F 1 "10k" H 4970 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4830 2300 50  0001 C CNN
F 3 "~" H 4900 2300 50  0001 C CNN
	1    4900 2300
	1    0    0    -1  
$EndComp
Connection ~ 4900 2450
Wire Wire Line
	4900 2450 4800 2450
$Comp
L Device:R R6
U 1 1 5DD5B2F8
P 4950 3200
F 0 "R6" H 5020 3246 50  0000 L CNN
F 1 "10k" H 5020 3155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4880 3200 50  0001 C CNN
F 3 "~" H 4950 3200 50  0001 C CNN
	1    4950 3200
	1    0    0    -1  
$EndComp
Connection ~ 4950 3350
Wire Wire Line
	4950 3350 4800 3350
Text GLabel 4250 2150 1    50   Input ~ 0
Vcc3.3V
Text GLabel 4250 3050 1    50   Input ~ 0
Vcc3.3V
Text GLabel 6950 2800 2    50   Input ~ 0
Vcc5V
Text GLabel 4900 2150 2    50   Input ~ 0
Vcc5V
Text GLabel 4950 3050 2    50   Input ~ 0
Vcc5V
$Comp
L dk_Transistors-FETs-MOSFETs-Single:BSS138 Q1
U 1 1 5DD5C04F
P 4600 2450
F 0 "Q1" V 4761 2450 60  0000 C CNN
F 1 "BSS138" V 4867 2450 60  0000 C CNN
F 2 "digikey-footprints:SOT-23-3" H 4800 2650 60  0001 L CNN
F 3 "https://www.onsemi.com/pub/Collateral/BSS138-D.PDF" H 4800 2750 60  0001 L CNN
F 4 "BSS138CT-ND" H 4800 2850 60  0001 L CNN "Digi-Key_PN"
F 5 "BSS138" H 4800 2950 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4800 3050 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Single" H 4800 3150 60  0001 L CNN "Family"
F 8 "https://www.onsemi.com/pub/Collateral/BSS138-D.PDF" H 4800 3250 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/BSS138/BSS138CT-ND/244294" H 4800 3350 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET N-CH 50V 220MA SOT-23" H 4800 3450 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 4800 3550 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4800 3650 60  0001 L CNN "Status"
	1    4600 2450
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Single:BSS138 Q2
U 1 1 5DD5EA57
P 4600 3350
F 0 "Q2" V 4761 3350 60  0000 C CNN
F 1 "BSS138" V 4867 3350 60  0000 C CNN
F 2 "digikey-footprints:SOT-23-3" H 4800 3550 60  0001 L CNN
F 3 "https://www.onsemi.com/pub/Collateral/BSS138-D.PDF" H 4800 3650 60  0001 L CNN
F 4 "BSS138CT-ND" H 4800 3750 60  0001 L CNN "Digi-Key_PN"
F 5 "BSS138" H 4800 3850 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4800 3950 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Single" H 4800 4050 60  0001 L CNN "Family"
F 8 "https://www.onsemi.com/pub/Collateral/BSS138-D.PDF" H 4800 4150 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/BSS138/BSS138CT-ND/244294" H 4800 4250 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET N-CH 50V 220MA SOT-23" H 4800 4350 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 4800 4450 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4800 4550 60  0001 L CNN "Status"
	1    4600 3350
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5DD63DBB
P 7400 2000
F 0 "J3" V 7462 2044 50  0000 L CNN
F 1 "Conn_01x02_Male" V 7553 2044 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7400 2000 50  0001 C CNN
F 3 "~" H 7400 2000 50  0001 C CNN
	1    7400 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	7900 2200 7400 2200
Wire Wire Line
	7300 2200 7150 2200
$Comp
L power:+12V #PWR01
U 1 1 5DD782C8
P 900 850
F 0 "#PWR01" H 900 700 50  0001 C CNN
F 1 "+12V" H 915 1023 50  0000 C CNN
F 2 "" H 900 850 50  0001 C CNN
F 3 "" H 900 850 50  0001 C CNN
	1    900  850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 850  900  850 
Connection ~ 1150 850 
$EndSCHEMATC
