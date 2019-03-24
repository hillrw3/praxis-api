class AddCurrentStreakToHabit < ActiveRecord::Migration[5.2]
  def change
    add_column :habits, :current_streak, :integer, default: 0
  end
end
