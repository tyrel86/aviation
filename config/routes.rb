Aviation::Application.routes.draw do
  match "/home" => "pages#home"
  get "/pages/story" => "pages#story"
  root :to => 'pages#home'
end
