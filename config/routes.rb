Rails.application.routes.draw do
  resources :presentations do
    member do
      get 'play'
    end
    resources :slides
  end
end
