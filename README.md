geektool-scripts
================

This is a collection of my ruby scripts to be used with Geektool. Each script takes some sane parameters and is documented below.

puts
----

*Description*: prints string eval of the input
*Usage*: puts ruby_string_expression
*Exmaples*:
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