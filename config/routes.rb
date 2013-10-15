HunterPreyApp::Application.routes.draw do
  devise_for :players
  
  root :to => 'home#index'
  resources :players
end
