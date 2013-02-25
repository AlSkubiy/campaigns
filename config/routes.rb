Campaigns::Application.routes.draw do
  root :to => 'campaigns#index'
  get "/campaings/countries" => 'campaigns#countries' 
  get "/campaings/languages" => 'campaigns#languages' 
  resources :campaigns
end
