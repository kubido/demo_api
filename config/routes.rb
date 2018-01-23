Rails.application.routes.draw do

  post 'create_page', to: 'pages#create'
  get 'pages', to: 'pages#index'

end
