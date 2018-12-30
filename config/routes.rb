Rails.application.routes.draw do
  resources :habits
  get '/progress_report' => "progress_report#show"
end
