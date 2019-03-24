class UiController < ActionController::Base
  def show
    render file: 'public/index.html'
  end
end