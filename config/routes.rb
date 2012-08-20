Homospiritus::Application.routes.draw do
  devise_for :users

  # Website
  root :to => 'flatpages#movement'

  get '/blog',        :to => 'flatpages#blog'
  get '/discussions', :to => 'discussions#index'
  get '/family',      :to => 'flatpages#family'
  
  get '/people',    :to => 'flatpages#people'
  get '/seminars',  :to => 'flatpages#seminars'

  mount ActiveadminBlog::Engine => '/blog'

  # Admin
  mount ActiveadminSettings::Engine => '/admin'
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
