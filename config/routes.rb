Rails.application.routes.draw do


  resources :categories
  resources :articles do #Generará todas las rutas del CRUD
    resources :comments, only: [:create, :update, :destroy, :show] #Hacemos esto para que no existan los comentarios por si solo, sinó que solo para los artículos
  end
  devise_for :users


  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
