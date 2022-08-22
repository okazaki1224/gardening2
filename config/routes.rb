Rails.application.routes.draw do
    #deviseで作ったものは最終的に一番上に！
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



  scope module: :public do
    root to: 'homes#top'
    #get 'homes/top'
    #get 'homes/about'
    get '/about' => 'homes#about', as: "about"

    resources:favorites, only:[:create, :destroy]
    #get 'favorites/create'
    #get 'favorites/destroy'
    resources:comments, only:[:create, :destroy]
    #get 'comments/create'
    #get 'comments/destroy'
    resources:users, only:[:index, :show, :edit, :update]
    #get 'users/index'
    #get 'users/show'
    #get 'users/edit'
    #get 'users/update'
    resources:post_images, only:[:index, :show, :new, :create, :destroy]
    #get 'post_images/index'
    #get 'post_images/show'
    #get 'post_images/new'
    resources:posts, only:[:index, :show, :new, :create, :destroy]
    #get 'posts/index'
    #get 'posts/show'
    #get 'posts/new'

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
