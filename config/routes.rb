Rails.application.routes.draw do
  resources :resource_maintypes
  resources :resource_subtypes
  resources :resources
  resources :activity_templates
  resources :people
  resources :events
  resources :tasks
  resources :activities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
