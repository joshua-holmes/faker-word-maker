Rails.application.routes.draw do
  resources :favorite_words, only: [:create, :destroy]
  resources :lexicons, only: [:index, :show, :create]
  get "/random_word", to: "dev_api#instructions"
  get "/random_word/:name", to: "dev_api#make_word"
  get "/random_word/:name/:length", to: "dev_api#make_word_with_length"
end
