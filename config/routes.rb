Rails.application.routes.draw do
  
  root to: "restaurants#home"
  get "restaurants/top", to: "restaurants#top"
  resources :restaurants do 
    resources :reviews, only: [:new, :create]
  end

end
