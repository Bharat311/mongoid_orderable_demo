MongoidOrderableDemo::Application.routes.draw do

  resources :employees, except: :show do
    get 'reorder', on: :member
    get 'move', on: :collection
    get 'list', on: :collection
  end

  root to: 'employees#index'

end
