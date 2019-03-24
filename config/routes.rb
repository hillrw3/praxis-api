Rails.application.routes.draw do
  namespace :api do
    resources :habits, only: [:index, :create, :destroy]
    post '/habits/:id/complete' => "habits#complete"
    get '/progress_report' => "progress_report#show"
  end

  root "ui#show"
  get '*path' => 'ui#show'
end
