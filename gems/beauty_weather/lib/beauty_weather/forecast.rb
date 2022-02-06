module BeautyWeather
  class Forecast
    attr_reader :city_id, :lang, :units

    def initialize(city_id:,lang: 'pt_br', units: 'metric')
      @city_id = city_id
      @lang = lang
      @units = units
    end

    def forecast
      @forecast = Client.new.get('/forecast', { id: city_id, lang: lang, units: units, appid: BeautyWeather.api_key })
    end
  end
end
