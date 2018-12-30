class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.belongs_to :habit
      t.date :completed_on, default: Date.today
      t.timestamps
    end
  end
end
