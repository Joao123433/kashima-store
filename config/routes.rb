Rails.application.routes.draw do
  devise_for :admins
  resources :clothings
  get 'inicio/index'
  root 'inicio#index'
  get 'inicio/compra'
  get 'inicio/carrinho'
  post 'inicio/adicionar_ao_carrinho/:id', to: 'inicio#adicionar_ao_carrinho', as: 'inicio_adicionar_ao_carrinho'
  delete 'inicio/remover_do_carrinho/:id', to: 'inicio#remover_do_carrinho', as: 'inicio_remover_do_carrinho'
  get 'inicio/informacao'
end
