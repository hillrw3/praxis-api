class ProgressReportController < ApplicationController
  def show
    render json: ProgressReport.for_today
  end
end