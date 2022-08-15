Rails.application.routes.draw do
  get 'lists/new'
  get 'lists/edit'
  get '/top' => 'homes#top'
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  # list毎の詳細画面
  get 'list/:id' => 'lists#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end