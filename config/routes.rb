Rails.application.routes.draw do
  
  root 'chatroom#index'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'

  post 'message', to: 'messages#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
