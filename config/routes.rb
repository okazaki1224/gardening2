Rails.application.routes.draw do
  namespace :public do
    get 'post_comments/index'
    get 'post_comments/edit'
    get 'post_comments/update'
    get 'post_comments/destroy'
  end
#deviseで作ったものは一番上に！
devise_for :users,skip: [:passwords], controllers: {
registrations: "public/registrations",
sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
sessions: "admin/sessions"
}

  namespace :admin do
    root to: 'homes#top'
    #get 'homes/top'
    resources:genres, only:[:index, :create, :edit, :update, :destroy]
    #get 'genres/index'
    #get 'genres/create'
    #get 'genres/edit'
    #get 'genres/update'
    #resources:post_images, only:[:index]
    #get 'post_images/index'
    #resources:post_comments, only:[:index, :edit, :update, :destroy]
    #get 'comments/index'
    #get 'comments/edit'
    #get 'comments/update'
    #get 'comments/destroy'
    resources:posts, only:[:index, :show, :edit, :update, :destroy] do
      resources:post_comments,only: [:index, :edit, :update]
    end
    #get 'posts/index'
    #get 'posts/show'
    #get 'posts/edit'
    #get 'posts/update'
    #get 'posts/destroy'
    #resources:post_comments,only: [:index, :edit, :update]
    resources:users, only:[:index, :show, :edit, :update]
    #get 'users/index'
    #get 'users/show'
    #get 'users/unsubscribe' => 'users#unsubscribe', as: "unsubscribe"
    #patch 'users/withdraw' => 'users#withdraw', as: "withdraw"
  end

  patch 'users/withdraw' => 'public/users#withdraw', as: "withdraw"

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: "about"
    #get 'homes/top'
    #get 'homes/about'

    resources:comments, only:[:create, :destroy]
    #get 'comments/create'
    #get 'comments/destroy'
    resources:users, only:[:index, :show, :edit, :update] do
      member do
        get :myfavorites
      end
    end
    #get 'users/myfavoritess' => 'public/users#myfavorites', as: "myfavorites"
    #get 'users/index'
    #get 'users/show'
    #get 'users/edit'
    #get 'users/update'

    resources:post_images, only:[:index, :show, :new, :create, :destroy]
    #get 'post_images/index'
    #get 'post_images/show'
    #get 'post_images/new'
    resources:posts, only:[:index, :show, :new, :create, :destroy] do
      resources:post_comments,only: [:create]
      resource:favorites, only:[:create, :destroy]
      #get 'search' => 'posts#search'
      get :search, on: :collection
    end
    #get 'posts/index'
    #get 'posts/show'
    #get 'posts/new'
  end
  get 'users/:id/unsubscribe' => 'public/users#unsubscribe', as: "unsubscribe"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
