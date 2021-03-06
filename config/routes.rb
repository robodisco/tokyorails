# -*- encoding : utf-8 -*-
Tokyorails::Application.routes.draw do

  scope "(:locale)", :locale => /en|ja/ do
    resources :members
    resources :events
    resources :photos
  end

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/logout' => 'sessions#destroy', :as => :logout

  match '/:locale' => 'homepage#index', :as => :locale_root

  root :to => 'homepage#index'
end
