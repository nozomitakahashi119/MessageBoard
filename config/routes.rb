Rails.application.routes.draw do
  
=begin
  # CRUD
  get 'messages/:id', to: 'messages#show'
  post 'messages', to: 'messages#cretae'
  put 'messages/:id', to: 'messages#update'
  delete 'messages/:id', to: 'messages#destroy'
  
  # index: showの補助ページ
  get 'messages', to: 'messages#index'
  
  # new: 新規作成用のフォーム
  get 'messages/new', to: 'messages#new'
  
  # edit: 更新用のフォーム
  get 'messages/:id/edit', to: 'messages#edit'
=end

  #トップページの指定
  root to: 'messages#index'

  #上記は次の記述で補完できる
  resources :messages
  
end