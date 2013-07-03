Flickr::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :users, :only => [:show] do
    resources :groups, :only => [:index, :edit]
  end
  resources :photos

  resources :groups, :only => [:create, :new]
  
  match '/groups/all' => "groups#all"

  root :to => "static_pages#home"
end
