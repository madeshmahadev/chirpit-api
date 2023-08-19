Rails.application.routes.draw do

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  namespace :api do
    namespace :v1 do
      resources :chirps
      resources :comments

      get 'comments_by_chirp/:chirp_id', to: 'comments#comments_by_chirp', as: :comments_by_chirp
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
