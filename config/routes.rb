Rails.application.routes.draw do
  get 'administrator/index'
  get 'welcome/index'
  resources :books do
    resources :reviews, only: [:create, :new]
  end
  resources :patron do
    resources :books
      get '/authors', to: 'patron#authors', as: 'authors'
      get '/titles', to: 'patron#titles', as: 'titles'
      get '/isbns', to: 'patron#isbns', as: 'isbns'
  end
  resources :administrators do
    resources :books
      get '/authors', to: 'administrator#authors', as: 'authors'
      get '/titles', to: 'administrator#titles', as: 'titles'
      get '/isbns', to: 'administrator#isbns', as: 'isbns'
      get '/checkout', to: 'administrator#checkout'
  end
  root 'welcome#index'
end
