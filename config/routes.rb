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
	resources :customers, only:[:show, :edit, :update,]do
		member do
			get :delete, as: :delete
			patch :active_false, as: :active_false
		end
	resource :order_details, only:[:new, :cretae, :complete]do
		member do
			get :check, as: :check
			get :complete, as: :complete
		end
	end
	resources :ordered_items, only:[:index, :show]
	resource :carts, only:[:show, :update, :destroy, :create]do
		member do
			delete :alldestroy, as: :alldestroy
		end
	end
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
