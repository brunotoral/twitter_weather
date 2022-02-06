module BeautyWeather
  class Configuration
    attr_accessor :api_key, :uri

    def initialize
      @api_key = nil
      @uri = nil
    end
  end
end
