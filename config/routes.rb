Rails.application.routes.draw do
  resources :habits, only: [:index, :create, :destroy]
  resources :records, only: [:create]
  get '/progress_report' => "progress_report#show"
end
