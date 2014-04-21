source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.8'

group :assets do
  gem 'sass-rails',       '~> 3.2.3'
  gem 'coffee-rails',     '~> 3.2.1'
  gem 'uglifier',         '>= 1.0.3'
  gem 'compass-rails',    '~> 1.0.3'
  gem 'zurb-foundation',  git: 'git://github.com/zurb/foundation.git'
end

gem 'jquery-rails'

# Mongoid 3.x
gem 'moped',                git: 'git://github.com/mongoid/moped.git'
gem "mongoid",              "~> 3.0.5"
gem "mongoid_search"
gem "devise",               ">= 2.1.2"
gem "activeadmin",          '~> 0.4.4'
gem "activeadmin-mongoid",  git: "git://github.com/elia/activeadmin-mongoid.git"
gem "carrierwave-mongoid",  git: "git://github.com/jnicklas/carrierwave-mongoid.git",
                            branch: "mongoid-3.0",
                            require: 'carrierwave/mongoid'
gem "activeadmin-blog"

# Assets
gem "aws-s3"
gem "fog"
gem "mini_magick"
gem "rmagick"
#gem "asset_sync"


group :production do
  gem 'thin'
end