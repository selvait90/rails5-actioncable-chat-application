Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'messages/create'

  get 'rooms/new'

  get 'rooms/create'

  get 'rooms/update'

  get 'rooms/edit'

  get 'rooms/destroy'

  get 'rooms/index'

  get 'rooms/show'

  get 'users/new'

  get 'users/create'

  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
