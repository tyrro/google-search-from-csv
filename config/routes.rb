Rails.application.routes.draw do
  root 'keywords#index'

  resources :keywords, only: %i(index create show)
end
