class CreateBuses < ActiveRecord::Migration[7.1]
  def change
    create_table :buses do |t|
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
