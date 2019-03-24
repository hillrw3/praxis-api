module Api
  class HabitsController < ApplicationController
    before_action :find_habit, only: :complete

    def index
      render json: Habit.all
    end

    def create
      Habit.create!(habit_params)
    end

    def destroy
      Habit.destroy(params[:id])
    end

    def complete
      HabitCompletionService.perform(@habit)
    end

    private

    def find_habit
      @habit = Habit.find(params[:id])
    end

    private

    def habit_params
      params.require(:habit).permit(:title)
    end
  end
end