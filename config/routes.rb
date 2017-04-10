Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :clientes
  resources :ctacteclis
  resources :facturas
  resources :lecturas
  resources :medidors
  resources :periodos
  resources :servicios
  root 'clientes#index'
end