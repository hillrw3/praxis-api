require 'rails_helper'

describe ProgressReport do
  describe '#for_today' do
    it 'returns all habits, marking any with a record for the day as completed' do
      write_code = create_habit({title: 'Write code'})
      work_out = create_habit({title: 'Work out'})

      create_record({habit_id: work_out.id})

      expect(ProgressReport.for_today).to eq({completed: [work_out], todo: [write_code]})
    end
  end

  describe '#reset_habits' do
    it 'sets current_streak = 0 for habits that dont have a record for the previous day' do
      write_code = create_habit({title: 'Write code', current_streak: 2})
      work_out = create_habit({title: 'Work out', current_streak: 2})

      create_record({habit_id: work_out.id, completed_on: Date.yesterday})

      ProgressReport.reset_habit_streaks

      expect(write_code.reload.current_streak).to eq(0)
      expect(work_out.reload.current_streak).to eq(2)
    end
  end
end