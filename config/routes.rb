Rails.application.routes.draw do
  root 'keywords#index'

  resources :keywords, only: %i(index show) do
    collection do
      post :import
    end
  end
end
