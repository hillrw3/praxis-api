class HabitsController < ApplicationController

  def index
    render json: Habit.all
  end

  def create
    Habit.create!(habit_params)
  end

  private

  def habit_params
    params.require(:habit).permit(:title)
  end
end