Rails.application.routes.draw do
  
  get 'sair/', to: 'sair#index'

  get 'login/', to: 'login#index'
  post 'login/', to: 'login#create'

  get 'home/', to: 'home#index'
  get 'home/id', to: 'home#show'

  get 'produto/', to: 'produto#index'
  post 'produto/', to: 'produto#create'

  get 'cliente/', to: 'cliente#index'
  post 'cliente/', to: 'cliente#create'

  get 'pedido/', to: 'pedido#index'
  get 'pedido/id', to: 'pedido#show'
  post 'pedido/', to: 'pedido#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
