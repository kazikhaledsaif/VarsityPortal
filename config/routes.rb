Rails.application.routes.draw do


  get 'profile', to: 'profile#index'
  get 'enrollment', to: 'enrollment#index'
  resources :courses
  resources :semesters
  match 'semester/status/:id', :to => 'semesters#update_current_status', :as => 'current_status', :via => :get
  match 'semester/:id/offer_course', :to => 'semesters#offer_course', :as => 'offer_course', :via => :get
  match 'semester/:id/offer_course/:course', :to => 'semester_courses#add_course', :as => 'add_offer_course', :via => :get
  match 'semester/:id/offer_course_remove/:course', :to => 'semester_courses#remove_course', :as => 'remove_offer_course', :via => :get
  match 'enrollment/:user/add/:course', :to => 'enrollment#add_course', :as => 'add_to_enrollment', :via => :get
  match 'enrollment/:user/remove/:course', :to => 'enrollment#remove_course', :as => 'remove_from_enrollment', :via => :get

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"
end
