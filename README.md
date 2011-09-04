geektool-scripts
================

This is a collection of my ruby scripts to be used with Geektool. Each script takes some sane parameters and is documented below.

puts
----

Description: prints string eval of the input  
Usage: puts ruby_string_expression  
Exmaples:  

    puts Hello, world! # => Hello, world!
    puts "Time: #{now 'hh:mm TT'}" # => Time: 03:32 AM

now
---

Description: prints current date and time using conventional format input like 'MM/DD/YY', 'MMMM D, YYYY' or 'hh:mm'  
Usage: now date_time_format  
Exmaples:  

    now MM/DD/YYYY # => 08/29/2011
    now MMMM D, YYYY # => August 29, 2011
    now h:mm TT # => 3:34 AM
    now HH:mm:ss # => 03:34:01
    
Formats:  

    now YYYY YY # => 2011 11
    now MMMM MMM MM M # => August Aug 08 8 (MM is zero-padded, M is not)
    now DDDD DDD DD D # => Monday Mon 29 29 (DD is zero-padded)
    now HH H hh h # => 03 3 03 3 (HH and H are 24-hour clock, hh and h are 12-hour; HH and hh are zero-padded)
    now TT T tt t # => AM A am a
    now mm m # => 34 34 (mm is zero-padded)
    now ss s # => 01 1 (ss is zero-padded)

weather
-------

Description: prints weather infomation using Yahoo! Weather, also caches files (RSS, image icon) to local folder  
Usage: weather weather_format  
Config file: config/weather.rb  
Exmaples:  

    weather CCCC, TTTT # => Fair, 66°F
    weather High: HHH, Low: LLL # => High: 87°, Low: 65°

Formats:  

    weather CCCC # => Fair (text description of current condition)
    weather TT TTT TTTT # => 66 66° 66°F (current temperature)
    weather HH HHH HHHH # => 87 87° 87°F (today's high)
    weather LL LLL LLLL # => 65 65° 65°F (today's low)

cpu
---

Description: prints CPU utilization according to 'top -l 2'
Usage: cpu cpu_format
Exmaples:

    cpu CPU: USED used, IDLE idle # => CPU: 8.81% used, 91.19% idle
    cpu CPU '[USED20|%]' USED # => CPU [|                   ] 6.34%

Formats:

    cpu USED IDLE # => 8.64% 91.36%
    cpu '[USED20|%] or |USED15*%|' # => [|                   ] or |               |
      ('USED' followed by length of pencentage bar, filling character, and '%')

mem
---

Description: prints memory utilization according to 'top -l 1'
Usage: mem memory_format
Exmaples:

    mem Memory: USEDM used, FREEM free, TOTALG in total # => Memory: 8093M used, 98M free, 8.0G in total
    mem MEM '[USED20|%]' USED% # => MEM [||||||||||||||||||| ] 98.8%

Formats:

    mem USED USEDM USEDG USED% # => 8100 8100M 7.91G 98.9%
    mem FREE FREEM FREEG FREE% # => 90 90M 0.09G 1.1%
    mem TOTAL TOTALM TOTALG # => 8190 8190M 8.0G 
    mem '[USED20|%] or |USED15*%|' # => [||||||||||||||||||| ] or |************** |
      ('USED' followed by length of pencentage bar, filling character, and '%')
