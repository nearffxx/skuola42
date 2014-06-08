Skuola42::Application.routes.draw do
  root to: "home#index"
  match 'home' => 'home#index', via: :get 
  match 'editorial' => 'editorial#index', via: :get, as: :editorials
  get 'school/index'
  get 'school/show_missions'
  get 'school/show_rules'
  get 'school/show_association'

  resources :subjects, only: [:index, :show] do
    member do
      get 'show_program'
      get 'show_professors'
      get 'show_events'
      get 'show_courses'
    end
  end
  
  resources :professors, only: [:index, :show, :new, :create] do
    member do
      get 'show_meetings'
    end
  end
  
  resources :structures, only: [:index, :show] do
    member do
      get 'show_events'
    end
  end
  
  resources :events, only: [:index, :show] do
    member do
      get 'index_types'
      get 'show_practical_info'
    end
  end
  
  resources :courses, only: [:index, :show] do
    member do
      get 'show_materials'
    end
  end
  
  resources :meetings, only: [:index, :show, :new, :create]
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
