Rails.application.routes.draw do
   namespace :api do
       namespace :v1 do
         post 'auth'=>'auth#create'
         resources :users do
             resources :posts
         end
       end
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end