class RenderTweetService
  attr_reader :temps, :current

  def initialize(temps:, current:)
    @temps = temps
    @current = current
  end

  def composed_message
    todays_msg + forecast_msg
  end

  private

  def todays_msg
    "#{current[:main][:temp]}°C e #{current[:weather][0][:description]} em #{current[:name]} em #{today}."
  end

  def forecast_msg
    " Média para os próximos dias: #{temperatures[0]}°C em #{dates[0]}, #{temperatures[1]}°C em #{dates[1]}, #{temperatures[2]}°C em #{dates[2]}, #{temperatures[3]}°C em #{dates[3]} e #{temperatures[4]}°C em #{dates[4]}."
  end

  def dates
    temps.keys
  end

  def temperatures
    temps.values
  end

  def today
    Date.today.strftime("%d/%m")
  end
end
