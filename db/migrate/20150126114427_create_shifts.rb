class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.date   :day
      t.text   :desc, null: false 
      t.text   :commit
      t.string :hours, null: false, default: ""

      t.timestamps null: false
    end
  end
end
