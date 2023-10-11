Rails.application.routes.draw do
  # implementamos la ruta que es un get a su pàth health depues le decimos que va ir a su controlador health a su metodo health
  get '/health', to: 'health#health'
end
