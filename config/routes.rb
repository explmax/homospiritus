#encoding: UTF-8
Homospiritus::Application.routes.draw do
  devise_for :users




  # About Us
  root :to => 'about#dvizhenie'
  get '/krug-very',           :to => 'about#krug_very',   as: 'krug_very'
  get '/kto-my-i-zachem_my',  :to => 'about#kto_my',      as: 'kto_my'
  get '/stil-zhizni',         :to => 'about#stil_zhizni', as: 'stil_zhizni'



  # Activity
  get '/nashy-seminary',          :to => 'activity#nashy_seminary',           as: 'nashy_seminary'
  get '/struktury-mediator-grup', :to => 'activity#struktury_mediator_grup',  as: 'struktury_mediator_grup'
  get '/online',                  :to => 'activity#online',                   as: 'online'
  get '/utrennie-meditacyi',      :to => 'activity#utrennie_meditacyi',       as: 'utrennie_meditacyi'
  get '/shkola-vedushih',         :to => 'activity#shkola_vedushih',          as: 'shkola_vedushih'

  

  # Cooperation
  get '/sotrudnichestvo',                       :to => 'cooperation#sotrudnichestvo',         as: 'sotrudnichestvo'
  get '/fondi',                                 :to => 'cooperation#fondi',                   as: 'fondi'
  get '/predlozheniya-dlya-firm',               :to => 'cooperation#dlya_firm',               as: 'predlozheniya_dlya_firm'
  get '/predlozheniya-dlya-vedushih-seminarov', :to => 'cooperation#dlya_vedushih_seminarov', as: 'predlozheniya_dlya_vedushih_seminarov'


  get '/discussions', :to => 'discussions#index'



  # Blog
  mount_blog_at '/blog'

  get '/utro',              :to => 'articles#utro',               as: 'utro'
  get '/reshenie_problemi', :to => 'articles#reshenie_problemi',  as: 'reshenie_problemi'
  get '/usilenie',          :to => 'articles#usilenie',           as: 'usilenie'
  get '/na_noch',           :to => 'articles#na_noch',            as: 'na_noch'



  # Admin
  mount_activeadmin_settings
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
