Rails.application.routes.draw do
get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sing_up" => "users#new", :as => "sing_up"
get 'registration_user/:active_code' => 'users#registration_user', as: :registration_user
root :to => "sessions#new"
resources :users
resources :sessions
resources :tasks do
	collection do
		delete 'delete_tasks'
	end
end
end