Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index',as: :top
   get 'login' =>'sessions#new' ,as: :login
   post 'session' =>'sessions#create' ,as: :session
   delete 'session' =>'sessions#destroy'
   resources :events,except:[:show,:destroy] do
    get 'page/:page', :action => :index, :on => :collection
   end

   patch 'personal_schedules'  => 'personal_schedules#update'
   get   'personal_schedules'  => 'personal_schedules#index'
   post  'personal_schedules'  => 'personal_schedules#create'
   resources :nittei_cyoseis,only:[:index,:create,:destroy]
   resources :moshikomis,except:[:show,:destroy]


end
