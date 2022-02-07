class WeatherService
  attr_reader :city_id, :current, :forecast

  def initialize(city_id)
    @city_id = city_id
    @current = fetch_weather_information
    @forecast = fetch_forecast_information
  end

  private

  def fetch_weather_information
    BeautyWeather.weather(city_id: city_id)
  end

  def fetch_forecast_information
    BeautyWeather.forecast(city_id: city_id)
  end
end
