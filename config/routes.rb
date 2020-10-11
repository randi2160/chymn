Rails.application.routes.draw do
  resources :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
      namespace 'v1' do
          resources :campaigns
      end
  end
  resources :users do
    collection do
      post 'login'
    end
  end
  
end
