class CalculateTemperatureService
  attr_reader :forecast

  def initialize(forecast)
    @forecast = forecast
  end

  def temperature
    grouped = group_by_date(forecast)

    grouped.delete(today)

    avarage(grouped)
  end

  private

  def group_by_date(forecast)
    forecast[:list].group_by { |item| day_month(item[:dt_txt])}
  end

  def avarage(temps)
    grouped_temps = {}
      temps.each do |date|
        grouped_temps["#{date[0]}"] = temps[date[0]].map do |i|
          (i[:main][:temp_min] + i[:main][:temp_max]) / 2
        end
        grouped_temps["#{date[0]}"] = (grouped_temps["#{date[0]}"].sum / grouped_temps["#{date[0]}"].size).floor(1)
      end

    grouped_temps
  end

  def day_month(str)
    date = Date.parse(str)

    date.strftime("%d/%m")
  end

  def today
    Date.today.strftime("%d/%m")
  end
end
