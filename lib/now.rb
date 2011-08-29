module GeektoolScripts
  def now(str = '') 
    # return current date and time using conventional format input like 'MM/DD/YY', 'MMMM D, YYYY' or 'hh:mm'

    t = Time.now

    map = [ [ 'YYYY', t.strftime('%Y') ],
            [ 'YY', t.strftime('%y') ],
            [ 'MMMM', t.strftime('%B') ],
            [ 'MMM', t.strftime('%b') ],
            [ 'MM', t.strftime('%m') ],
            [ 'M', t.mon.to_s ],
            [ 'DDDD', t.strftime('%A') ],
            [ 'DDD', t.strftime('%a') ],
            [ 'DD', t.strftime('%d') ],
            [ 'D', t.day.to_s ],
            [ 'HH', t.strftime('%H') ],
            [ 'H', t.hour.to_s ],
            [ 'hh', t.strftime('%I') ],
            [ 'h', (t.hour % 12).to_s ],
            [ 'mm', t.strftime('%M') ],
            [ 'm', t.min.to_s ],
            [ 'ss', t.strftime('%S') ],
            [ 's', t.sec.to_s ],
            [ 'TT', t.strftime('%p') ],
            [ 'T', t.strftime('%p')[0] ],
            [ 'tt', t.strftime('%P') ],
            [ 't', t.strftime('%P')[0] ] ]

    strfmt str, map
  end
end
