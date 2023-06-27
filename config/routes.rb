Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes, only: [:index, :new, :create, :show, :destroy, :put]

  match 'recipes/:recipe_id' => 'recipes#toggle_public', as: :toggle_public, via: :patch
end
