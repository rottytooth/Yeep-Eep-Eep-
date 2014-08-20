1 rem yeep! eep! eep! v1.0.0
2 rem created 2010 daniel temkin
3 rem version 1.0.0 created 2014
4 rem daniel@danieltemkin.com
5 rem shared under Creative Commons Attribution 2.5 lic
6 rem use as you wish, but please give attribution

80 let qr = 0

100 rem initial settings
110 poke53281,1 :rem set background color #0 to white
120 poke53282,3 :rem set background color #1 to cyan
130 poke53283,8 :rem set background color #2 to orange
140 poke53270,peek(53270)or16:rem turn on multicolor mode
150 c=13*4096+8*256:rem set c to point to color memory
160 poke53280,1 :rem set screenframe to white
170 poke792,193 :rem disable run-stop (for installation)

200 let b = 0 :rem current vic register
210 let d = 1 :rem current number of colors

300 get a$ : if a$ = "" goto 300
310 rem here we wait for user input

400 if asc(a$) = 29 then gosub 1100 :rem right
410 if asc(a$) = 50 then gosub 1100 :rem joystick right
420 if asc(a$) = 62 then gosub 1100 :rem > 
430 if asc(a$) = 46 then gosub 1100 :rem .
440 if asc(a$) = 85 then gosub 1100 :rem u i
450 if asc(a$) = 79 or asc(a$) = 80 then gosub 1100 :rem o p
460 if asc(a$) = 64 or asc(a$) = 42 then gosub 1100 :rem @ *
470 if asc(a$) = 33 then gosub 1100 :rem !
480 if asc(a$) > 73 and asc(a$) < 77 then gosub 1100 :rem j-l

500 if asc(a$) = 157 then gosub 1200 :rem left
510 if asc(a$) = 29 then gosub 1200 :rem joystick left
520 if asc(a$) = 60 then gosub 1200 :rem <
530 if asc(a$) = 44 then gosub 1200 :rem ,
540 if asc(a$) = 81 or asc(a$) = 87 then gosub 1200 :rem q w
550 if asc(a$) = 69 or asc(a$) = 82 then gosub 1200 :rem e r
560 if asc(a$) = 84 or asc(a$) = 89 then gosub 1200 :rem t y
570 if asc(a$) > 76 and asc(a$) < 79 then gosub 1200 :rem n m 

600 if asc(a$) = 43 then gosub 1250 :rem + 
610 if asc(a$) > 48 and asc(a$) < 54 then gosub 1250 :rem 0-5

700 if asc(a$) = 45 then gosub 1400 :rem -
710 if asc(a$) > 53 and asc(a$) < 58 then gosub 1400 :rem 6-9
720 if asc(a$) = 48 then gosub 1400

800 if asc(a$) = 67 or asc(a$) = 68 then gosub 1500 :rem c d
810 if asc(a$) = 70 or asc(a$) = 86 then gosub 1500 :rem f v

900 if asc(a$) = 88 or asc(a$) = 90 then gosub 1700 :rem x z
910 if asc(a$) = 65 or asc(a$) = 83 then gosub 1700 :rem a s

950 if asc(a$) = 66 or asc(a$) = 71 then gosub 1800 :rem b g
960 if asc(a$) = 78 or asc(a$) = 72 then gosub 1800 :rem h n

1000 if asc(a$) = 55 then gosub 2000 :rem joystick up
1010 if asc(a$) = 145 then gosub 2000 :rem up

1090 goto 300 :rem end of main cycle

1095 rem subroutines

1100 let b = b + 2 :rem increment glitch
1110 if b > 255 then let b = 0
1120 poke 53272, b
1130 return

1200 let b = b - 2 :rem decrement glitch
1210 if b < 0 then let b = 255
1220 poke 53272, b
1230 return

1245 rem note: color changes are s l o w . . .

1250 rem add one more color, distributed randomly across chars
1260 let d = d + 1 :if d = 16 then let d = 15
1270 for c = 0 to 999
1280 let cd = int(rnd(0)*999) :rem also scatter changes
1290 let ce = int(rnd(0)*999) :rem more scatter
1300 let g$ = ""
1310 get g$ : if g$ <> "" then return
1320 poke 55296 + c, int(rnd(0)*d)
1330 poke 55296 + cd, int(rnd(0)*d)
1340 poke 55296 + ce, int(rnd(0)*d)
1350 next
1360 return 

1400 rem remove one color
1410 let d = d - 1 :if d = -1 then let d = 0
1420 for c = 0 to 999
1430 let cd = int(rnd(0)*999) :rem also scatter changes
1440 let ce = int(rnd(0)*999) :rem more scatter
1450 let g$ = ""
1460 get g$ : if g$ <> "" then return
1470 poke 55296 + c, int(rnd(0)*d)
1475 poke 55296 + cd, int(rnd(0)*d)
1480 poke 55296 + ce, int(rnd(0)*d)
1485 next
1490 return 

1499 rem change bkgd color
1500 let e = int(rnd(0)*256)
1510 let f = int(rnd(0)*256)
1520 let g = int(rnd(0)*256)
1530 poke53280,e :rem border
1540 poke53281,e :rem background
1550 poke53282,f
1560 poke53283,g
1570 return

1698 rem this only has an effect on some screens
1699 rem add random characters
1700 for a = 0 to 10
1710 poke 1024+int(rnd(0)*999),int(rnd(0)*255)
1720 next
1730 return 

1797 reset

1799 rem back to multi-color mode
1800 print chr$(147)
1810 return

1990 rem randomizing character sets
1995 rem this also only works on some screens
2000 let qj = 0
2010 if qr > 255 then let qr = 0
2020 for qi = 12288 + qr to 12288+qr+10
2030  if qi >= 12288 + 256 and qi < 12288 + 262 then goto 2080
2040  if qj = 9 then let qj = 0
2050  if qj < 5 then poke qi, peek(qi+int(rnd(0)*8))
2060  if qj < 5 then poke qi + 128,peek(qi+int(rnd(0)*8))
2070  let qj = qj + 1
2080 next
2090 let qr = qr + 10
2095 return
