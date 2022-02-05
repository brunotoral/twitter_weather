require'./gem/lib/beauty_weather'

BeautyWeather.configure do |config|
  config.api_key = ENV['OPEN_WEATHER_KEY']
end
