HunterPreyApp::Application.routes.draw do
  resources :games

  devise_for :players
  
  root :to => 'home#index'
  resources :players
end
