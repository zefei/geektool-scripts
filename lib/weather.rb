require 'fileutils'
require 'open-uri'

module GeektoolScripts
  @@yahoo_weather_api_url = 'http://weather.yahooapis.com/forecastrss?w=#{woeid}&u=#{unit}'

  def weather(str = '') 
    # return weather infomation using Yahoo! Weather, also caches files (RSS, image icon) to local folder
    
    woeid = @@yahoo_weather_url[/(\d*)\/$/, 1] || '' # location parameter
    unit = @@temperature_unit == :f ? 'f' : 'c' # unit parameter
    rss_url = string_eval @@yahoo_weather_api_url, binding
    @@cache_folder = File.expand_path @@cache_folder
    rss_filepath = File.join @@cache_folder, 'weather.xml'
    icon_filepath = File.join @@cache_folder, 'weather.png'

    begin
      if not File.directory? @@cache_folder 
        # if cache folder doesn't exist, create it
        FileUtils.mkdir_p @@cache_folder
      end
    rescue
    end

    begin
      rss = open(rss_url).read
      page = open(@@yahoo_weather_url).read
    rescue
      # if weather page cannot be loaded, load from cache
      begin
        rss_file = open(rss_filepath)
        rss = rss_file.read
        rss_file.close
        page = ''
      rescue
        # if cache cannot be loaded, we are doomed and kittens are killed
        rss = ''
        page = ''
      end
    end

    condition = rss[/<yweather:condition.*?text="(.*?)".*?\/>/, 1] || ''
    temperature = rss[/<yweather:condition.*?temp="(.*?)".*?\/>/, 1] || ''
    unit = rss[/<yweather:units.*?temperature="(.*?)".*?\/>/, 1] || ''
    high = rss[/<yweather:forecast.*?high="(.*?)".*?\/>/, 1] || ''
    low = rss[/<yweather:forecast.*?low="(.*?)".*?\/>/, 1] || ''
    icon_url = page[/"forecast-icon".*?background:url\('(.*?)'\)/, 1] || ''

    begin
      # cache weather page and icon file
      rss_file = open(rss_filepath, 'wb+')
      rss_file.write rss
      rss_file.close
      icon_file = open(icon_filepath, 'wb+')
      icon_file.write open(icon_url).read
      icon_file.close
    rescue
    end

    map = [ [ 'CCCC', condition ],
            [ 'TTTT', temperature + "\302\260" + unit ],
            [ 'TTT', temperature + "\302\260" ],
            [ 'TT', temperature ],
            [ 'HHHH', high + "\302\260" + unit ],
            [ 'HHH', high + "\302\260" ],
            [ 'HH', high ],
            [ 'LLLL', low + "\302\260" + unit ],
            [ 'LLL', low + "\302\260" ],
            [ 'LL', low ] ]

    strfmt str, map
  end
end
