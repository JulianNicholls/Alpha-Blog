source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3'

  # Access an IRB console on exception pages or using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Call 'byebug' anywhere in the code to stop and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'minitest-reporters', '1.0.17'
end

group :production do
  gem 'unicorn'
  gem 'unicorn-rails'

  gem 'pg'
  gem 'rails_12factor'
end

# Project-specific

gem 'bootstrap-sass', '~> 3.4.1'
gem 'will_paginate', '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
