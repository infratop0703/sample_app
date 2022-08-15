Rails.application.routes.draw do
  get 'lists/new'
  get '/top' => 'homes#top'
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  # list毎の詳細画面
  get 'list/:id' => 'lists#show', as: "list" #'lists#showの設定をlistとして利用できる'
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end