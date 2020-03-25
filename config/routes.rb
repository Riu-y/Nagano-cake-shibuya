Rails.application.routes.draw do
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

devise_scope :admins do
	get 'admins/sign_in' => 'admins/sessions#create'
	get 'admins/sign_out' => 'admins/sessions#destroy'
end

devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

devise_scope :customers do
	get 'customers/sign_in' => 'customers/sessions#create'
	get 'customers/sign_out' => 'customers/sessions#destroy'
end

namespace :admins do
	resources :customers, only:[:index, :show, :edit, :update]
	resources :products
	resources :ordered_items, only: [:index, :show, :update]
	resources :genres, only: [:index, :create, :edit, :update]
	root 'homes#top'
end


namespace :customers do
	resources :customers, only:[:show, :edit, :update]do
		member do
			get :delete, as: :delete
			patch :active_false, as: :active_false
		end
		resources :order_details, only:[:new, :create]do
			member do
				get :check, as: :check
				get :complete, as: :complete
				post :finish, as: :finish
			end
		end
		resources :ordered_items, only:[:index, :show]
		resources :carts, only:[:index, :update, :destroy, :create]
	    delete '/customers/customers/:customer_id/cart_alldestroy' => 'carts#alldestroy', as: :alldestroy
		resources :shipping_addresses, only:[:index, :create, :edit, :update, :destroy]
	end
	root 'homes#top'
end

	resources :products, only: [:index, :show]do
		 member do
			get :genre_search
		end
	end
end
