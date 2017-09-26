Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'clientes#index'
  resources :clientes
  resources :ctacteclis
  resources :facturas
  resources :lecturas
  resources :medidors
  resources :pagos
  resources :periodos
  resources :servicios
  resources :reportes, only: [:index]
  post 'facturas/facturar'
end