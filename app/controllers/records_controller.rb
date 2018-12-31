class RecordsController < ApplicationController

  def create
    Record.create!(record_params)
  end

  private

  def record_params
    params.require(:record).permit(:habit_id)
  end
end
