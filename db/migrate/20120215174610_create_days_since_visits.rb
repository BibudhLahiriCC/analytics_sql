class CreateDaysSinceVisits < ActiveRecord::Migration
  def change
    create_table :days_since_visits do |t|

      t.timestamps
    end
  end
end
