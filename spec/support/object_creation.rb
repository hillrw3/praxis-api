def create_habit(attributes = {})
  Habit.create!({title: "Write code #{rand}"}.merge(attributes))
end

def create_record(attributes = {})
  habit_id = attributes[:habit_id] || create_habit.id
  Record.create!({habit_id: habit_id}.merge(attributes))
end