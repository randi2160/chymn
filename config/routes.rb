Rails.application.routes.draw do
 
  #devise_for :deviseusers
 resources :users do
    collection do
      post 'login'
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
      namespace 'v1' do
          resources :campaigns
          resource :user
    scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }
     resource :user, only: [:show, :update]
  end
          
          
      end
  end
end
