Rails.application.routes.draw do
  scope '/api' do
    mount_devise_token_auth_for 'User', at: 'auth'
    mount_devise_token_auth_for 'Admin', at: 'admin_auth'
    resources :posts
    as :admin do
      # Define routes for Admin within this block.
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
