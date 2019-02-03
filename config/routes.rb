Rails.application.routes.draw do

	devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'profile', to: 'users#profile', as: 'profile'
	get 'bonus', to: 'users#seagull', as: 'bonus'
	root to: 'posts#index'
    resources :posts
    resources :reports

end
