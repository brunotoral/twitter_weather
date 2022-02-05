module BeautyWeather
  class Error < ::StandardError ; end

  class Unauthorized < Error ; end

  class ServiceUnavaible < Error ; end
end