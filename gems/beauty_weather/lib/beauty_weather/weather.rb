module BeautyWeather
  class Weather
    attr_reader :city_id, :lang, :units

    def initialize(city_id:, lang: 'pt_br', units: 'metric')
      @city_id = city_id
      @lang = lang
      @units = units
    end

    def weather
      @weather = Client.new.get('/weather', { id: city_id, lang: lang, units: units, appid: BeautyWeather.api_key })
    end
  end
end
