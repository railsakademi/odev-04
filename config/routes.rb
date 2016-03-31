Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :movies
  root to: "movies#index"
  resources :ratings
  resources :comments

  get 'category/:id' => 'categories#list', as: :category_list
  get 'hakkinda', to: "pages#about", as: :about
  get 'iletisim', to: "pages#contact", as: :contact

end
