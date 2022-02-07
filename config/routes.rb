Rails.application.routes.draw do
  resources :activity_templates
  resources :resources
  resources :resource_subtypes
  resources :resource_types
  resources :people
  resources :events
  resources :tasks
  resources :activities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
