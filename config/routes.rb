Aviation::Application.routes.draw do
  post "flightaware/flightmap"
  post "flightaware/flightinfo"

  post "mailer/destroy"

  get "mailer/activate"

  post "mailer/create"

  get "admin/index"

  get "sessions/new"

  get "sessions/destroy"

  post "sessions/create"

  resources :videos

  resources :stories

  get "articles/index"

  get "articles/new"

  post "articles/create"

  get "articles/destroy"

  match "/home" => "pages#home"
  get "/pages/story" => "pages#story"
  root :to => 'pages#home'
  get "/pages/info" => "pages#info"
  get "/pages/story_no_click" => "pages#story_no_click"
  match "/login" => "sessions#new"
  match "/snatcher" => "pages#snatcher"
end
