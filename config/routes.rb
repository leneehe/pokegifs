Rails.application.routes.draw do
  resources :pokemon, only: %i[index show]
  root 'pokemon#index'
  get 'team', to: 'pokemon#team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
