Rails.application.routes.draw do

  resources :messages
  resources :conversations
  resources :communities
  devise_for :users
  resources :users
  resources :posts
  resources :friendships
  resources :comments, only:[:create,:update,:destroy]



  # Not sure if I can make these members ?
  post '/add_user', to: 'communities#add_user'
  post '/remove_user', to: 'communities#remove_user'
  #get "", to 'communities#remove_user'

  #root to: 'user_sessions#new'
  #root 'devise/sessions#new'


  devise_scope :user do
      authenticated :user do
        root 'posts#index', as: :authenticated_root
      end
    end
    root 'devise/sessions#new'



  # resources :user_sessions, only:[:create,:new]
  # # This following line is a  'feature' of the gem

  # This is necessary because devise takes over control of the
  # Normal path. This allows the admin to create a user without
  # loging in
  post '/create_user_no_devise', to: 'users#create'
  patch '/update_user_no_devise/:id', to: 'users#update'
  patch '/changepw', to: 'users#changepw'


  get ':id/:model/:type/:id_image/:uploader/serve_image', to: 'images#serve_image'

  #mount ActionCable.server, at: '/cable'
  mount ActionCable.server => '/cable'
end
