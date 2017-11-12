Rails.application.routes.draw do
  resources :goal_date_employees
  resources :goal_dates
  resources :goals
  resources :employees
  resources :stores
  devise_for :owners
end
