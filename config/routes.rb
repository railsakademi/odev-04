Rails.application.routes.draw do
  resources :movies
  root to: "pages#home"
  get 'hakkinda', to: "pages#about", as: :about
  get 'iletisim', to: "pages#contact", as: :contact

end
