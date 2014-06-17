MongoidOrderableDemo::Application.routes.draw do

  resources :employees, except: :show do
    get 'reorder',  on: :member
    collection do
      get 'move'
      get 'list'
      get 'order'
    end
  end

  root to: 'employees#index'

end
