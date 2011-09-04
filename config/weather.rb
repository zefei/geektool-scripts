module GeektoolScripts
  @@yahoo_weather_url = 'http://weather.yahoo.com/united-states/california/torrance-12795786/' # yahoo weather url for your city
  @@temperature_unit = :c # :f or :c
  @@cache_folder = File.expand_path(File.dirname(__FILE__) + '/../cache') # folder to cache weather.xml and weather.png
end
