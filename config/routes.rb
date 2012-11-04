NumberapiThehodgeCoUk::Application.routes.draw do

root :to => 'pages#index'

match '/:id' => 'pages#number', :as => 'request'
end
