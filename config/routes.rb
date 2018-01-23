Rails.application.routes.draw do

  post 'create_page', to: 'page#create'
  get 'pages', to: 'page#index'

end
