Rails.application.routes.draw do

  # resources :recipe_foods
  resources :foods
  resources :users
  get '/general_shopping_list' , to: 'users#shopping_list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :recipes, only: [:index, :new, :create, :show, :destroy, :put]
  resources :recipes, only: [:new, :create, :index, :show, :destroy, :put] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  match 'recipes/:recipe_id' => 'recipes#toggle_public', as: :toggle_public, via: :patch
  get 'recipes/:recipe_id/new_ingredient' , to: 'recipes#new_ingredient' , as: :new_ingredient
  post 'recipes/:recipe_id/new_ingredient' , to: 'recipes#create_ingredient' , as: :create_ingredient
  get "public_recipes", to: "public_recipes#index"
end
