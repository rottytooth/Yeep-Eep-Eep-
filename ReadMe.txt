*******************************************************************
__     __             _ ______           _ ______           _ 
\ \   / /            | |  ____|         | |  ____|         | |
 \ \_/ /__  ___ _ __ | | |__   ___ _ __ | | |__   ___ _ __ | |
  \   / _ \/ _ \ '_ \| |  __| / _ \ '_ \| |  __| / _ \ '_ \| |
   | |  __/  __/ |_) |_| |___|  __/ |_) |_| |___|  __/ |_) |_|
   |_|\___|\___| .__/(_)______\___| .__/(_)______\___| .__/(_)
               | |                | |                | |      
               |_|                |_|                |_|      
*******************************************************************

Yeep! generates glitch imagery by messing with character encodings on the Commodore. 

The magic happens on lines 1100 and 2100; that's where it sets the location for the video matrix and the character generator, without initializing. It leads to results that differ across machines, and depend on what (if anything) was run onscreen before the program starts, what is currently in memory.

It also applies color randomly across the screen.

I wrote this in Commodore Basic 2.0, and kept things as simple and clear as I could in case it would be useful for others messing with the Commodore.

Released 2010
http://danieltemkin.com


