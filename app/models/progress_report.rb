class ProgressReport
  def self.for_today
    habits = Habit.all.to_a
    todays_records = Record.where(completed_on: Date.today).to_a
    record_habit_ids = todays_records.map(&:habit_id)
    completed = habits.select {|h| record_habit_ids.include?(h.id)}

    {completed: completed, todo: habits - completed}
  end
end