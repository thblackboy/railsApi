Rails.application.routes.draw do
  get 'urls/index'
  get 'urls/:short_link', to: 'urls#show'
  get 'urls/:short_link/stats', to: 'urls#stats'
  post 'urls/:link', to: 'urls#create'
  post 'urls/', to: 'urls#create'

  # resources :urls do
  #resource
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
