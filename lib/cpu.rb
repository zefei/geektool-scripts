module GeektoolScripts
  def cpu(str = '') 
    # a wrapper around top, returns memory utilization

    top = `top -l 2`
    idle = top.scan(/CPU usage: .* (.*?)% idle/)[1][0].to_f # idle CPU%
    used = round(100 - idle, 2)

    barmap = str.scan(/(USED(\d+)(.?)(.?)%)/).map { |x| [ x[0], to_bar(used, x[1], x[2], x[3]) ] } # percentage bar

    map = [ [ 'USED', used.to_s + '%' ],
            [ 'IDLE', idle.to_s + '%' ] ]

    strfmt str, barmap + map
  end
end
