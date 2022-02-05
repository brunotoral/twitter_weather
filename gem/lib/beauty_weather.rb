require_relative 'beauty_weather/configuration.rb'
require_relative 'beauty_weather/client.rb'
require_relative 'beauty_weather/weather.rb'
require_relative 'beauty_weather/error.rb'

module BeautyWeather
  class << self
    extend Forwardable

    attr_accessor :configuration

    def_delegators :configuration, :api_key

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset_configuration!
      self.configuration = Configuration.new
    end

    def weather(params = {})
      @weather ||= Weather.new(lat: params[:lat], lon: params[:lon])
      @weather.current
    end

    def forecast(params = {})
      @weather ||= Weather.new(lat: params[:lat], lon: params[:lon])
      @weather.next_five_days
    end
  end
end
