class HabitCompletionService
  def self.perform(habit)
    habit.increment(:current_streak) if habit.records.last.completed_on == Date.yesterday
    habit.records << Record.new
    habit.save!
  end
end