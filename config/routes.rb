Homospiritus::Application.routes.draw do
  devise_for :users

  # Website
  root :to => 'flatpages#movement'

  get '/discussions', :to => 'discussions#index'
  get '/family',      :to => 'flatpages#family'
  
  get '/people',      :to => 'flatpages#people'
  get '/seminars',    :to => 'flatpages#seminars'
  get '/who-we-are',  :to => 'flatpages#who_we_are', as: 'who_we_are'
  get '/life-style',  :to => 'flatpages#life_style', as: 'life_style'

  # Blog
  mount_blog_at '/blog'

  # Admin
  mount_activeadmin_settings
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
