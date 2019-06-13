Rails.application.routes.draw do
    root 'blogs#index'
    
    devise_for :users
    resources :blogs do
        collection do
            post :confirm
        end
    end
    
    resources :users

end
