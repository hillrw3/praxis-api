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
end