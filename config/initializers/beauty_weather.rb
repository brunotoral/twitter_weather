BeautyWeather.configure do |config|
  config.api_key = ENV['OPEN_WEATHER_KEY']
  config.uri = ENV['OPEN_WEATHER_URI']
end
