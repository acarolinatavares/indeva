Rails.application.routes.draw do
  devise_for :owners

  root 'stores#index'

  resources :goal_date_employees
  resources :goal_dates
  resources :goals
  resources :employees
  resources :stores
end
