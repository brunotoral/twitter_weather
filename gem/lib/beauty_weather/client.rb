module BeautyWeather
  class Client
    attr_accessor :uri, :adapter

    def initialize(adapter: HTTParty, uri: 'https://api.openweathermap.org/data/2.5' )
      @adapter = adapter
      @uri = uri
    end

    def get(path, options = {})
      response = adapter.get(complete_path(path), query: options)
      handle_response response
    end

    private

    def handle_response(response)
      case response.code
      when 200
        JSON.parse response.body, symbolize_names: true
      when 401
        raise BeautyWeather::Unauthorized, response.code
      when  503
        raise BeautyWeather::ServiceUnavailable, response.code
      else
        raise BeautyWeather::Error, response.code
      end
    end

    def complete_path(path)
      "#{uri}#{path}"
    end
  end
end
