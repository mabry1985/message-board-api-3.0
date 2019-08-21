Rails.application.routes.draw do
  concern :api_base do
    resources :groups do
      resources :messages
    end
  end

  namespace :v1 do
    concerns :api_base
  end
end
