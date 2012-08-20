Homospiritus::Application.routes.draw do
  devise_for :users

  # Website
  root :to => 'flatpages#movement'

  get '/discussions', :to => 'discussions#index'
  get '/family',      :to => 'flatpages#family'
  
  get '/people',    :to => 'flatpages#people'
  get '/seminars',  :to => 'flatpages#seminars'

  # Blog
  mount_blog_at '/blog'

  # Admin
  mount ActiveadminSettings::Engine => '/admin'
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
