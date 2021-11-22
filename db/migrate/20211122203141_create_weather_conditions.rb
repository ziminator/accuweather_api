class CreateWeatherConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_conditions do |t|
      t.string :local_observation_date_time
      t.integer :epoch_time
      t.float :temperature_metric_value
      t.string :temperature_metric_unit
      t.integer :temperature_metric_unit_type

      t.timestamps
    end
  end
end
