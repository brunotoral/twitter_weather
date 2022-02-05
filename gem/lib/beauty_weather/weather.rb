module BeautyWeather
  class Weather
    attr_reader :lat, :lon, :lang, :units

    def initialize(lat:, lon:, lang: 'pt_br', units: 'metric')
      @lat = lat
      @lon = lon
      @lang = lang
      @units = units
    end

    def current
      Client.new.get('/weather', { lat: lat, lon: lon, lang: lang, units: units, appid: BeautyWeather.api_key })
    end

    def next_five_days
      Client.new.get('/forecast', { lat: lat, lon: lon, lang: lang, units: units, appid: BeautyWeather.api_key })
    end
  end
end
