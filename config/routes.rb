Rails.application.routes.draw do
  
  root to: "restaurants#home"
  resources :restaurants do 
    resources :reviews, only: [:new, :create]
    collection do
      get "top"
    end
  end
end
