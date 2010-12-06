Refinery::Application.routes.draw do
  resources :map_locations, :path => '/map'

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :map_locations, :path => '/map'
  end
end
