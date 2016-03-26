Rails.application.routes.draw do
  resources :movies
  root to: "pages#home"
  get 'hakkinda', to: "about", as: :about
  get 'iletisim', to: "contact", as: :contact

end
