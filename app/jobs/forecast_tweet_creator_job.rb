class ForecastTweetCreatorJob < ApplicationJob
  queue_as :default

  def perform(params)
    weather_service = WeatherService.new(params[:city_id])
    temperatures = CalculateTemperatureService.new(weather_service.forecast).temperature
    rendered = RenderTweetService.new(temps: temperatures, current: weather_service.current)

    TweetService.new(message: rendered.composed_message, params: params[:twitter]).tweet
  end
end
