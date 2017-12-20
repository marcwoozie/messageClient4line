Rails.application.routes.draw do

  root "messages#index"

  resources :messages
  resources :users
  resources :channel_users

  post 'channels/push' => 'channels#push'
  post 'messages/receive' => 'messages#receive'
  get 'channels/room/:id' => 'channels#room', as: :channel_room
  resources :channels

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
