class Record < ApplicationRecord
  before_create :set_completed_on
  belongs_to :habit

  private

  def set_completed_on
    self.completed_on ||= Date.today
  end
end
