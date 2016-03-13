Rails.application.routes.draw do

  resources :recurrings
  resources :feedbacks
  resources :offline_users
  get 'page/home'
  get 'page/about'
  get 'page/contact'
  root 'dashboard#index'
  devise_for :ops_users #,skip: :registration
  get 'users/new'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get '/tandc' => 'extras#tandc'
  get 'ratecard' => 'extras#ratecard'
  get '/cookstatus' => 'extras#cookstatus'
  post '/sessions/signout' => 'sessions#signout'
  post '/sessions/signin' => 'sessions#signin'
  post '/sessions/verifyotp' => 'sessions#verify_otp'  
  devise_scope :ops_user do    
  match '/sessions/ops_user', to: 'devise/sessions#create', via: :post
  end
  post '/changepassword' => 'users#changepassword'
    get '/service_requests' =>'service_requests#index'
      get '/completed_index' =>'service_requests#completed_index'

get '/cancelled_index' =>'service_requests#cancelled_index'


    #get '/service_requests/:id' =>'service_requests#edit'
    get '/swap_status/:id' => 'service_requests#swap_status'
    post '/createotpforgot' => 'sessions#createotpforgot'
    post '/verifyotpforgot' => 'sessions#verifyotpforgot'
    resources :sessions
    resources :users 
    resources :service_providers
      resources :service_requests
          resources :dashboard
    namespace :api do
    resources :service_providers
    resources :service_requests
    post '/service_requests/create_upcoming' => 'service_requests#create_upcoming'
    post '/service_request/update_party' => 'service_requests#update_party'
    get '/service_request/upcoming' => 'service_requests#upcoming'
    get '/service_request/all' => 'service_requests#all'
    resources :service_provider_work_histories
    get '/getuserrequest/:user_id' => 'service_requests#select_request'
    post '/service_request/cancel' => 'service_requests#cancel'
    end
    delete '/log_out/:user_id' => 'sessions#destroy', :as => 'log_out'
  get '/dsruser' => 'dsr#dsruser'
  get '/uniqreq' => 'dsr#uniqreq'
  get '/dsrserreq' => 'dsr#dsrserreq'
end
