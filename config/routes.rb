Rails.application.routes.draw do
  # implementamos la ruta que es un get a su pàth health despues le decimos que va ir a su controlador health a su método health
  get '/health', to: 'health#health'
  resources :posts, only: [:index, :show, :create, :update]
end
