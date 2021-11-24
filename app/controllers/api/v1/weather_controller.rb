class Api::V1::WeatherController < ApplicationController

  require 'rufus-scheduler'

  def current
    response = HTTParty.get(HTTP_CURRENT)
    weather_hashes = JSON.parse(response.body)
    weather_hashes.map do |weather_hash|
      @weather_current = WeatherCondition.new(temperature_metric_value: weather_hash['Temperature']['Metric']['Value'])
    end

    render json: @weather_current.temperature_metric_value
  end

  def historical
    @scheduler = Rufus::Scheduler.new
    if WeatherCondition.all == []
      @weather_24 = http_data(HTTP_24)

      @scheduler.every '1h1m' do
        WeatherCondition.delete_all
        http_data(HTTP_24)
      end

    else
      @weather_24 = WeatherCondition.all
    end

    render json: @weather_24
  end

  def max
    @weather_max = WeatherCondition.maximum(:temperature_metric_value)
    render json: @weather_max
  end

  def min
    @weather_min = WeatherCondition.minimum(:temperature_metric_value)
    render json: @weather_min
  end

  def avg
    @weather_avg = WeatherCondition.average(:temperature_metric_value)
    render json: @weather_avg.round(1)
  end

  def by_time

  end

  private

  def http_data(http_str)
    response = HTTParty.get(http_str)
    weather_hashes = JSON.parse(response.body)
    weather_hashes.map do |weather_hash|
      WeatherCondition.create(local_observation_date_time: weather_hash['LocalObservationDateTime'], epoch_time: weather_hash['EpochTime'],
      temperature_metric_value: weather_hash['Temperature']['Metric']['Value'])
    end
  end

end
