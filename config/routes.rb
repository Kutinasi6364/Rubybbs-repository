Rails.application.routes.draw do
  get '/' => 'main#top'
  get 'top' => 'main#top'
  get 'edit' => 'main#edit'
  get 'main/top' => 'main#top'
  get 'main/:id/edit' => 'main#edit'
  get 'main/:id/delete' => 'main#delete'

  get 'user/signup'
  get 'user/login_form'

  delete 'main/destroy' => 'main#destroy'
  post 'main/create' => 'main#create'
  post 'main/update' => 'main#update'
  post 'user/register' => 'user#register'
  post 'user/login' => 'user#login'
  post 'user/logout' => 'user#logout'
end
