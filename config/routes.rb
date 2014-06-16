Skuola42::Application.routes.draw do
  root to: "home#index"
  match 'home' => 'home#index', via: :get 
  match 'editorial' => 'editorial#index', via: :get, as: :editorials
  match 'error_editorial' => 'editorial#error', via: :get, as: :error_editorial
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
  
  resources :structures, only: [:index, :show, :new, :create] do
    member do
      get 'show_events'
    end
  end
  
  resources :events, only: [:index, :show, :new, :create] do
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
  
  resources :activities, only: [:index, :show, :new, :create] do
    member do
      get 'show_modality'
    end
  end
end
