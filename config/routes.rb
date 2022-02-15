Rails.application.routes.draw do
  root to: "admins#index"

  get 'see', to: "registration#index"

  get "signUp", to:"registration#new"

  post "signUp", to: "registration#create"

  delete "logout", to: "sessions#destroy"

  get "signIn", to:"sessions#new"

  post "signIn", to: "sessions#create"

  get "seeBooks", to: "bookspage#index"

  get "addBook", to: "bookspage#new"
  post "addBook", to: "bookspage#create"

  get "issueBook", to: "bookissue#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
