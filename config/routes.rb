Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :orders, defaults: { format: :json }, only: [] do
    member do
      get :print_receipt
    end
  end
end
