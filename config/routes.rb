Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :users
end
