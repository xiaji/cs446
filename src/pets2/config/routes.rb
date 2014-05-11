Pets::Application.routes.draw do

  resources :foster_parents do
    collection do
      get :view_all
    end
  end


  resources :pet_considerings

  resources :considerings

  post "foster/agreement/:id", to: "foster#agreement", as: "foster_agreement"
  post "foster/confirmation/:id", to: "foster#confirmation", as: "foster_confirmation"
  get "animal_display/index", as: "animal_display"
  get "animal_display/sort_by_name", as: "sort_by_name"
  get "animal_display/sort_by_age", as: "sort_by_age"
  get "animal_display/sort_by_name_reverse", as: "sort_by_name_reverse"
  get "animal_display/sort_by_age_reverse", as: "sort_by_age_reverse"

  resources :pets

  root "animal_display#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
