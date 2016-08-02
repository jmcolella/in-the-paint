Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :teams, only: [:index, :show] do
    resources :articles, except: [:index] do
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :users, except: [:index]

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

end
