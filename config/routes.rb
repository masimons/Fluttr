Flickr::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :users, :only => [:show, :edit, :update] do
    member do 
      get 'mymap'
    end
    resources :favorites, :only => [:index]
    resources :groups, :only => [:index]
    resources :albums
  end
  
  resources :photos do
    collection do
      get 'all', :as => :all
    end
    resources :comments, :only => [:create, :destroy]
  end
  
  resources :tags

  resources :favorites, :only => [:create] do
    collection do
      delete 'destroy_favorite'
    end
  end

  resources :followings, :only => [:create] do
    collection do
      delete 'destroy_following'
    end
  end

  resources :memberships, :only => [:create] do
    collection do
      delete 'destroy_membership'
    end
  end

  resources :groups, :only => [:create, :new, :show, :destroy, :edit, :update] do
    collection do
      get 'all', :as => :all
    end
  end

  root :to => "static_pages#home"
end
