Rails.application.routes.draw do
  resources :favorite_words, only: [:create, :destroy]
  resources :lexicons, only: [:index, :show, :create]
  get "/random_word", to: "dev_api_controller#instructions"
  get "/random_word/:name", to: "dev_api_controller#make_word"
  get "/random_word/:name/:length", to: "dev_api_controller#make_word_with_length"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
