EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:b33rn4ryCounterPCB-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "b33rn4ryCounterPCB"
Date "2017-08-14"
Rev "0.1"
Comp "Geraffel Village Inc"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RPi_GPIO J1
U 1 1 599152D6
P 3400 2750
F 0 "J1" H 4150 3000 60  0000 C CNN
F 1 "RPi_GPIO" H 4150 2900 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20" H 3400 2750 60  0001 C CNN
F 3 "" H 3400 2750 60  0000 C CNN
	1    3400 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 59915866
P 9000 3850
F 0 "#PWR01" H 9000 3600 50  0001 C CNN
F 1 "GND" H 9000 3700 50  0000 C CNN
F 2 "" H 9000 3850 50  0000 C CNN
F 3 "" H 9000 3850 50  0000 C CNN
	1    9000 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3850 9000 3550
$Comp
L GND #PWR02
U 1 1 599158A3
P 5900 4900
F 0 "#PWR02" H 5900 4650 50  0001 C CNN
F 1 "GND" H 5900 4750 50  0000 C CNN
F 2 "" H 5900 4900 50  0000 C CNN
F 3 "" H 5900 4900 50  0000 C CNN
	1    5900 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2950 5900 4900
Wire Wire Line
	5900 2950 5100 2950
Wire Wire Line
	5100 3350 5900 3350
Connection ~ 5900 3350
Wire Wire Line
	5100 4150 5900 4150
Connection ~ 5900 4150
$Comp
L GND #PWR03
U 1 1 599158EA
P 2550 4900
F 0 "#PWR03" H 2550 4650 50  0001 C CNN
F 1 "GND" H 2550 4750 50  0000 C CNN
F 2 "" H 2550 4900 50  0000 C CNN
F 3 "" H 2550 4900 50  0000 C CNN
	1    2550 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3150 2550 4900
Wire Wire Line
	2550 3150 3200 3150
Wire Wire Line
	3200 3950 2550 3950
Connection ~ 2550 3950
Wire Wire Line
	3200 4650 2550 4650
Connection ~ 2550 4650
Wire Wire Line
	5100 4350 5900 4350
Connection ~ 5900 4350
$Comp
L +5V #PWR04
U 1 1 59915A6F
P 5900 2550
F 0 "#PWR04" H 5900 2400 50  0001 C CNN
F 1 "+5V" H 5900 2690 50  0000 C CNN
F 2 "" H 5900 2550 50  0000 C CNN
F 3 "" H 5900 2550 50  0000 C CNN
	1    5900 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2850 5100 2850
Wire Wire Line
	5900 2550 5900 2850
Wire Wire Line
	5100 2750 5900 2750
Connection ~ 5900 2750
$Comp
L GND #PWR05
U 1 1 59915BAB
P 7500 3850
F 0 "#PWR05" H 7500 3600 50  0001 C CNN
F 1 "GND" H 7500 3700 50  0000 C CNN
F 2 "" H 7500 3850 50  0000 C CNN
F 3 "" H 7500 3850 50  0000 C CNN
	1    7500 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3550 7500 3850
$Comp
L +5V #PWR06
U 1 1 59915C74
P 7200 3250
F 0 "#PWR06" H 7200 3100 50  0001 C CNN
F 1 "+5V" H 7200 3390 50  0000 C CNN
F 2 "" H 7200 3250 50  0000 C CNN
F 3 "" H 7200 3250 50  0000 C CNN
	1    7200 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3550 7600 3700
Wire Wire Line
	7600 3700 7200 3700
Wire Wire Line
	7200 3700 7200 3250
NoConn ~ 8100 3550
NoConn ~ 8200 3550
NoConn ~ 8300 3550
NoConn ~ 8400 3550
$Comp
L GND #PWR07
U 1 1 59915E97
P 7900 3850
F 0 "#PWR07" H 7900 3600 50  0001 C CNN
F 1 "GND" H 7900 3700 50  0000 C CNN
F 2 "" H 7900 3850 50  0000 C CNN
F 3 "" H 7900 3850 50  0000 C CNN
	1    7900 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3550 7900 3850
$Comp
L CONN_01X16 P1
U 1 1 599157D6
P 8250 3350
F 0 "P1" H 8250 4200 50  0000 C CNN
F 1 "Display 20x4" V 8350 3350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x16" H 8250 3350 50  0001 C CNN
F 3 "" H 8250 3350 50  0000 C CNN
	1    8250 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 3450 2900 3450
Wire Wire Line
	2900 3450 2900 2200
Wire Wire Line
	6400 2200 6400 5000
$Comp
L POT RV1
U 1 1 599165EF
P 7450 2500
F 0 "RV1" H 7450 2420 50  0000 C CNN
F 1 "10k" H 7450 2500 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Bourns_3339P_Angular_ScrewUp" H 7450 2500 50  0001 C CNN
F 3 "" H 7450 2500 50  0000 C CNN
	1    7450 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	7450 2650 7450 2950
Wire Wire Line
	7450 2950 7000 2950
Wire Wire Line
	7000 2950 7000 4150
Wire Wire Line
	7000 4150 7700 4150
Wire Wire Line
	7700 4150 7700 3550
$Comp
L GND #PWR08
U 1 1 59916814
P 7150 2650
F 0 "#PWR08" H 7150 2400 50  0001 C CNN
F 1 "GND" H 7150 2500 50  0000 C CNN
F 2 "" H 7150 2650 50  0000 C CNN
F 3 "" H 7150 2650 50  0000 C CNN
	1    7150 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2500 7150 2500
Wire Wire Line
	7150 2500 7150 2650
$Comp
L +5V #PWR09
U 1 1 5991686E
P 7750 2300
F 0 "#PWR09" H 7750 2150 50  0001 C CNN
F 1 "+5V" H 7750 2440 50  0000 C CNN
F 2 "" H 7750 2300 50  0000 C CNN
F 3 "" H 7750 2300 50  0000 C CNN
	1    7750 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 2500 7750 2500
Wire Wire Line
	7750 2500 7750 2300
NoConn ~ 3200 3550
NoConn ~ 3200 3650
NoConn ~ 3200 3750
NoConn ~ 3200 3850
NoConn ~ 3200 4050
NoConn ~ 3200 4150
NoConn ~ 3200 4250
NoConn ~ 3200 4350
NoConn ~ 3200 4450
NoConn ~ 3200 4550
NoConn ~ 5100 4050
NoConn ~ 5100 4250
NoConn ~ 5100 4450
NoConn ~ 5100 4550
NoConn ~ 5100 4650
Wire Wire Line
	5100 3650 5900 3650
Connection ~ 5900 3650
$Comp
L CONN_01X03 P2
U 1 1 59916C8F
P 9750 2500
F 0 "P2" H 9750 2700 50  0000 C CNN
F 1 "Counter" V 9850 2500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 9750 2500 50  0001 C CNN
F 3 "" H 9750 2500 50  0000 C CNN
	1    9750 2500
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P3
U 1 1 59916DD1
P 9750 1500
F 0 "P3" H 9750 1700 50  0000 C CNN
F 1 "Console" V 9850 1500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 9750 1500 50  0001 C CNN
F 3 "" H 9750 1500 50  0000 C CNN
	1    9750 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 59916E4D
P 9450 1700
F 0 "#PWR010" H 9450 1450 50  0001 C CNN
F 1 "GND" H 9450 1550 50  0000 C CNN
F 2 "" H 9450 1700 50  0000 C CNN
F 3 "" H 9450 1700 50  0000 C CNN
	1    9450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1600 9450 1600
Wire Wire Line
	9450 1600 9450 1700
Wire Wire Line
	6200 1500 9550 1500
Wire Wire Line
	5100 3150 6300 3150
Wire Wire Line
	6300 3150 6300 1400
Wire Wire Line
	6300 1400 9550 1400
Wire Wire Line
	6200 1500 6200 3050
Wire Wire Line
	6200 3050 5100 3050
$Comp
L GND #PWR011
U 1 1 59917118
P 9400 2800
F 0 "#PWR011" H 9400 2550 50  0001 C CNN
F 1 "GND" H 9400 2650 50  0000 C CNN
F 2 "" H 9400 2800 50  0000 C CNN
F 3 "" H 9400 2800 50  0000 C CNN
	1    9400 2800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR012
U 1 1 59917254
P 9400 2250
F 0 "#PWR012" H 9400 2100 50  0001 C CNN
F 1 "+5V" H 9400 2390 50  0000 C CNN
F 2 "" H 9400 2250 50  0000 C CNN
F 3 "" H 9400 2250 50  0000 C CNN
	1    9400 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 2400 9400 2400
Wire Wire Line
	9400 2400 9400 2250
Wire Wire Line
	9550 2600 9400 2600
Wire Wire Line
	9400 2600 9400 2800
Wire Wire Line
	5100 3850 5650 3850
Wire Wire Line
	5650 3850 5650 1200
Wire Wire Line
	5650 1200 8950 1200
Wire Wire Line
	8950 1200 8950 2500
Wire Wire Line
	8950 2500 9550 2500
$Comp
L BC548 Q1
U 1 1 59917560
P 7200 5700
F 0 "Q1" H 7400 5775 50  0000 L CNN
F 1 "BC548" H 7400 5700 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow_Oval" H 7400 5625 50  0000 L CIN
F 3 "" H 7200 5700 50  0000 L CNN
	1    7200 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 59917726
P 7300 6050
F 0 "#PWR013" H 7300 5800 50  0001 C CNN
F 1 "GND" H 7300 5900 50  0000 C CNN
F 2 "" H 7300 6050 50  0000 C CNN
F 3 "" H 7300 6050 50  0000 C CNN
	1    7300 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5900 7300 6050
Wire Wire Line
	8900 3550 8900 5300
Wire Wire Line
	8900 5300 7300 5300
Wire Wire Line
	7300 5300 7300 5500
Wire Wire Line
	3200 3050 2150 3050
Wire Wire Line
	2150 3050 2150 5700
Wire Wire Line
	2150 5700 7000 5700
$Comp
L Q_NMOS_GDS Q2
U 1 1 59917A6D
P 9350 5600
F 0 "Q2" H 9650 5650 50  0000 R CNN
F 1 "IRL2203N" H 10000 5550 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-220_Neutral123_Horizontal" H 9550 5700 50  0001 C CNN
F 3 "" H 9350 5600 50  0000 C CNN
	1    9350 5600
	1    0    0    -1  
$EndComp
$Comp
L R 1k1
U 1 1 59917BFD
P 8750 5600
F 0 "1k1" V 8830 5600 50  0000 C CNN
F 1 "R" V 8750 5600 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 8680 5600 50  0001 C CNN
F 3 "" H 8750 5600 50  0000 C CNN
	1    8750 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 5600 9150 5600
Wire Wire Line
	5100 3950 5600 3950
Wire Wire Line
	5600 3950 5600 5450
Wire Wire Line
	5600 5450 8300 5450
Wire Wire Line
	8300 5450 8300 5600
Wire Wire Line
	8300 5600 8600 5600
$Comp
L GND #PWR014
U 1 1 59917E6F
P 9450 5950
F 0 "#PWR014" H 9450 5700 50  0001 C CNN
F 1 "GND" H 9450 5800 50  0000 C CNN
F 2 "" H 9450 5950 50  0000 C CNN
F 3 "" H 9450 5950 50  0000 C CNN
	1    9450 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 5800 9450 5950
$Comp
L CONN_01X02 P4
U 1 1 59917F21
P 10050 5050
F 0 "P4" H 10050 5200 50  0000 C CNN
F 1 "12V" V 10150 5050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 10050 5050 50  0001 C CNN
F 3 "" H 10050 5050 50  0000 C CNN
	1    10050 5050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 59917FDE
P 9800 5300
F 0 "#PWR015" H 9800 5050 50  0001 C CNN
F 1 "GND" H 9800 5150 50  0000 C CNN
F 2 "" H 9800 5300 50  0000 C CNN
F 3 "" H 9800 5300 50  0000 C CNN
	1    9800 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5100 9800 5100
Wire Wire Line
	9800 5100 9800 5300
Wire Wire Line
	9450 5000 9850 5000
Wire Wire Line
	9450 5000 9450 5400
$Comp
L CONN_01X06 P5
U 1 1 599184BA
P 4100 6800
F 0 "P5" H 4100 7150 50  0000 C CNN
F 1 "RTC" V 4200 6800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 4100 6800 50  0001 C CNN
F 3 "" H 4100 6800 50  0000 C CNN
	1    4100 6800
	1    0    0    -1  
$EndComp
NoConn ~ 3900 6550
$Comp
L GND #PWR016
U 1 1 5991856F
P 3800 7100
F 0 "#PWR016" H 3800 6850 50  0001 C CNN
F 1 "GND" H 3800 6950 50  0000 C CNN
F 2 "" H 3800 7100 50  0000 C CNN
F 3 "" H 3800 7100 50  0000 C CNN
	1    3800 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 7050 3800 7050
Wire Wire Line
	3800 7050 3800 7100
NoConn ~ 3900 6650
Wire Wire Line
	3200 2750 1650 2750
Wire Wire Line
	1650 2750 1650 6950
Wire Wire Line
	1650 6950 3900 6950
Wire Wire Line
	3200 2850 1750 2850
Wire Wire Line
	1750 2850 1750 6850
Wire Wire Line
	1750 6850 3900 6850
Wire Wire Line
	3900 6750 1850 6750
Wire Wire Line
	1850 6750 1850 2950
Wire Wire Line
	1850 2950 3200 2950
Wire Wire Line
	6400 5000 8800 5000
Wire Wire Line
	8800 5000 8800 3550
Wire Wire Line
	3200 3350 3000 3350
Wire Wire Line
	3000 3350 3000 2300
Wire Wire Line
	3000 2300 6500 2300
Wire Wire Line
	6500 2300 6500 4900
Wire Wire Line
	6500 4900 8700 4900
Wire Wire Line
	8700 4900 8700 3550
Wire Wire Line
	2900 2200 6400 2200
Wire Wire Line
	3100 3250 3200 3250
Wire Wire Line
	3100 2400 6600 2400
Wire Wire Line
	6600 2400 6600 4800
Wire Wire Line
	6600 4800 8600 4800
Wire Wire Line
	8600 4800 8600 3550
Wire Wire Line
	5100 3450 6300 3450
Wire Wire Line
	6300 3450 6300 4700
Wire Wire Line
	6300 4700 8500 4700
Wire Wire Line
	8500 4700 8500 3550
Wire Wire Line
	3100 3250 3100 2400
Wire Wire Line
	5100 3750 6700 3750
Wire Wire Line
	6700 3750 6700 4600
Wire Wire Line
	6700 4600 7800 4600
Wire Wire Line
	7800 4600 7800 3550
Wire Wire Line
	5100 3550 6800 3550
Wire Wire Line
	6800 3550 6800 4500
Wire Wire Line
	6800 4500 8000 4500
Wire Wire Line
	8000 4500 8000 3550
NoConn ~ 5100 3250
$EndSCHEMATC
