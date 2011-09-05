module GeektoolScripts
  def string_eval(str = '', b = binding)
    # eval str as string

    eval '"' + str + '"', b
  end

  def strfmt(str, map) 
    # format string using an [ special_string, replacement ] array
    # e.g. strfmt 'abcde', [ [ 'b', 'e' ], [ 'de', 'b' ] ] => 'aecb'

    str = string_eval str
    ret = '' # return string

    while str != ''
      size = str.size

      map.each do |m|
        # pop each special character from the start of the format string, map and push it to the return string
        if str.start_with? m[0]
          ret += m[1]
          str = str[m[0].size..-1]
          break
        end
      end

      if size == str.size
        # if nothing is mapped, pop one character and push it to the return string
        ret += str[0, 1]
        str = str[1..-1]
      end
    end

    return ret
  end

  def to_bar(percent, length = 10, filling = '|', spacing = '-')
    # make a percentage bar from percentage, bar length, filling character, and spacing character
    filling = '|' if filling == ''
    spacing = '-' if spacing == ''
    percent = percent.to_f / 100
    percent = 1 if percent > 1
    filling * (percent * length.to_i) + spacing * ((1 - percent) * length.to_i).ceil
  end

  def round(float, decimal = 0)
    # round float to some decimal place, backport from 1.9.2
    shift = (10 ** decimal).to_f
    (float.to_f * shift).round / shift
  end
end
