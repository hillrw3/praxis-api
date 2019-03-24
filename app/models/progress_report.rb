class ProgressReport
  def self.for_today
    reset_habit_streaks

    habits = Habit.all.to_a
    todays_records = Record.where(completed_on: Date.today).to_a
    record_habit_ids = todays_records.map(&:habit_id)
    completed = habits.select {|h| record_habit_ids.include?(h.id)}

    {completed: completed, todo: habits - completed}
  end

  def self.reset_habit_streaks
    habits = Habit.all.to_a

    yesterdays_records = Record.where(completed_on: Date.yesterday).to_a
    need_to_be_reset = habits.select {|h| !yesterdays_records.map(&:habit_id).include?(h.id)}
    Habit.where(id: need_to_be_reset.map(&:id)).update_all(current_streak: 0)
  end
end