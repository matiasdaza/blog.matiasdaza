Rails.application.routes.draw do

  resources :articles #Generará todas las rutas del CRUD

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
