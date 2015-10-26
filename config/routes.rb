FacebookAuthExample::Application.routes.draw do
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'
    get 'public_keys', to: 'public_keys#index', as: 'public_keys'

    resources :sessions,  only: [:create, :destroy]
    resource  :home,      only: [:show]
    resources :games,     only: [:show, :create, :index]

    root to: "home#show"
end
