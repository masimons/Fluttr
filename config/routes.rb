Flickr::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :users, :only => [:show, :edit, :update] do
    resources :groups, :only => [:index, :edit]
    resources :albums
  end
  
  resources :photos do
    resources :comments, :only => [:create, :destroy]
  end
  
  resources :tags

  resources :memberships, :only => [:create, :destroy]

  resources :groups, :only => [:create, :new, :show, :destroy] do
    collection do
      get 'all', :as => :all_groups
    end
  end
  
  match '/groups/all' => "groups#all", :as => :all_groups

  root :to => "static_pages#home"
end
