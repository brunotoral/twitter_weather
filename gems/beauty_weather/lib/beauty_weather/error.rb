module BeautyWeather
  class Error < ::StandardError ; end

  class Unauthorized < Error ; end

  class BadRequest < Error ; end

  class ServiceUnavailable < Error ; end
end
