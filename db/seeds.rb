# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = HTTParty.get("http://dataservice.accuweather.com/currentconditions/v1/571951/historical/24?apikey=BklnPnq0pgD5Gd94IjwkHBL3cp6JCAMy&details=true")
weather_hashes = JSON.parse(response.body)
weather_hashes.map do |weather_hash|
  WeatherCondition.create(local_observation_date_time: weather_hash['LocalObservationDateTime'], epoch_time: weather_hash['EpochTime'],
  temperature_metric_value: weather_hash['Temperature']['Metric']['Value'])
end
