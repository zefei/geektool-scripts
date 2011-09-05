module GeektoolScripts
  def mem(str = '') 
    # a wrapper around top, returns memory utilization

    top = `top -l 1`
    inactive, used, free = top.scan(/PhysMem: .* (.*?) inactive, (.*?) used, (.*?) free/)[0].map { |x| x.to_i } # used and free memory in MB
    total = used + free
    used -= inactive
    free += inactive
    usedp = round(used.to_f / total * 100, 2) # used%
    freep = round(free.to_f / total * 100, 2) # free%

    barmap = str.scan(/(USED(\d+)(.?)(.?)%)/).map { |x| [ x[0], to_bar(usedp, x[1], x[2], x[3]) ] } # percentage bar

    map = [ [ 'USED%', usedp.to_s + '%' ],
            [ 'USEDM', used.to_s + 'M' ],
            [ 'USEDG', round(used.to_f / 1024, 2).to_s + 'G' ],
            [ 'USED', used.to_s ],
            [ 'FREE%', freep.to_s + '%' ],
            [ 'FREEM', free.to_s + 'M' ],
            [ 'FREEG', round(free.to_f / 1024, 2).to_s + 'G' ],
            [ 'FREE', free.to_s ],
            [ 'TOTALM', total.to_s + 'M' ],
            [ 'TOTALG', round(total.to_f / 1024, 2).to_s + 'G' ],
            [ 'TOTAL', total.to_s ] ]

    strfmt str, barmap + map
  end
end
