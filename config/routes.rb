Rails.application.routes.draw do
  root 'ideas#index'

  resources :ideas, except: %i[new index] do
    post '/upvote', to: 'upvotes#upvote'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
