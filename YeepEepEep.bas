1 rem yeep! eep! eep! v0.1.2
2 rem (c)2010 daniel temkin 
3 rem daniel@danieltemkin.com
5 rem shared under Creative Commons Attribution 2.5 lic
6 rem use as you wish, but please give attribution

8 let qr = 0

10 rem initial settings
11 poke53281,1 :rem set background color #0 to white
12 poke53282,3 :rem set background color #1 to cyan
13 poke53283,8 :rem set background color #2 to orange
14 poke53270,peek(53270)or16:rem turn on multicolor mode
15 c=13*4096+8*256:rem set c to point to color memory

20 let b = 0 :rem current vic register
30 let d = 1 :rem current number of colors

40 get a$ : if a$ = "" goto 40
45 rem here we wait for user input
50 if asc(a$) = 29 then gosub 100 :rem right
53 if asc(a$) = 50 then gosub 100 :rem joystick right
55 if asc(a$) = 62 then gosub 100 :rem > 
58 if asc(a$) = 46 then gosub 100 :rem .
60 if asc(a$) = 157 then gosub 200 :rem left
63 if asc(a$) = 29 then gosub 200 :rem joystick left
65 if asc(a$) = 60 then gosub 200 :rem <
68 if asc(a$) = 44 then gosub 200 :rem ,
70 if asc(a$) = 43 then gosub 300 :rem + 
75 if asc(a$) = 45 then gosub 400 :rem -
80 if asc(a$) = 67 then gosub 500 :rem "c"
85 if asc(a$) = 88 then gosub 700 :rem "x"
90 if asc(a$) = 66 then gosub 800 :rem "b"
93 if asc(a$) = 55 then gosub 1000 :rem joystick up
95 if asc(a$) = 145 then gosub 1000 :rem up

98 goto 40

100 let b = b + 2 :rem increment glitch
105 if b > 255 then let b = 0
110 poke 53272, b
120 return

200 let b = b - 2 :rem decrement glitch
205 if b < 0 then let b = 255
210 poke 53272, b
220 return

295 rem note: color changes are s l o w . . .
300 rem add one more color, distributed randomly across chars
310 let d = d + 1 :if d = 16 then let d = 15
320 for c = 0 to 999
323 let g$ = ""
325 get g$ : if g$ <> "" then return
330 poke 55296 + c, int(rnd(0)*d)
340 next
350 return 

400 rem remove one color
410 let d = d - 1 :if d = -1 then let d = 0
420 for c = 0 to 999
423 let g$ = ""
425 get g$ : if g$ <> "" then return
430 poke 55296 + c, int(rnd(0)*d)
440 next
450 return 

499 rem change bkgd color
500 let e = int(rnd(0)*256)
510 let f = int(rnd(0)*256)
520 let g = int(rnd(0)*256)
530 poke53281,e
540 poke53282,f
550 poke53283,g
580 return

698 rem this only has an effect on some screens
699 rem add random characters
700 for a = 0 to 10
710 poke 1024+int(rnd(0)*999),int(rnd(0)*255)
720 next
730 return 

797 reset
799 rem back to multi-color mode
800 print chr$(147)
810 return

990 rem undocumented feature: randomizing character sets
995 rem this also only has an effect on some screens
1000 let qj = 0
1005 if qr > 255 then let qr = 0
1010 for qi = 12288 + qr to 12288+qr+10
1020  if qi >= 12288 + 256 and qi < 12288 + 262 then goto 1060
1030  if qj = 9 then let qj = 0
1040  if qj < 5 then poke qi, peek(qi+int(rnd(0)*8))
1048  if qj < 5 then poke qi + 128,peek(qi+int(rnd(0)*8))
1050  let qj = qj + 1
1060 next
1065 let qr = qr + 10
1070 return