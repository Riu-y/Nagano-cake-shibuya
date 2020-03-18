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

namespace :admins do
	resources :customers, only:[:index, :show, :edit, :update]
	resources :products
	resources :ordered_items, only: [:index, :show, :update]
	resources :genres, only: [:index, :create, :edit, :update]
	root 'homes#top'
end


namespace :cutomers do
	resources :customers, only:[:show, :edit, :update,]do
		member do
			get :delete, as: :delete
		end
	resource :order_details, only:[:new, :cretae, :complete]do
		member do
			get :check, as: :check
			get :complete, as: :complete
		end
	end
	resources :ordered_items, only:[:index, :show]
	resources :carts, only:[:show, :update, :destroy]do
		member do
			delete :alldestroy, as: :alldestroy
		end
	end
	resources :shipping_addresses, only:[:index, :create, :edit, :update, :destroy]
	root 'homes#top'
	end
end

	resources :products, only: [:index, :show]
	 # adminとcustomer でrootをどう分ける？

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
