source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
# gem "sqlite3", "~> 1.4"

# Use pg as a database for Active Record [https://github.com/ged/ruby-pg]
gem 'pg', '~> 1.5', '>= 1.5.4'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

gem 'data_migrate', '~> 9.2'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Devise for new users registarion [https://github.com/heartcombo/devise]
gem 'devise', '~> 4.9', '>= 4.9.3'

# Use ahs_scope for providing filtration of the list [https://github.com/heartcombo/has_scope]
gem 'has_scope', '~> 0.8.2'

# Use pry-rails for debugging application []
gem 'pry-rails', '~> 0.3.4'

# Use dotenv for loading environment variables from `.env` [https://github.com/bkeepers/dotenv]
gem 'dotenv', '~> 2.8', '>= 2.8.1'
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # Use Rspec for testing [https://rubygems.org/gems/rspec-rails]
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'

  # Use factory_bot_rails for creating objects in your test env [https://github.com/thoughtbot/factory_bot_rails]
  gem 'factory_bot_rails', '~> 6.2'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

  # Use Faker for generate fake data [https://github.com/faker-ruby/faker]
  gem 'faker', '~> 3.2', '>= 3.2.1'
end

gem "dockerfile-rails", ">= 1.5", :group => :development

gem "sentry-ruby", "~> 5.12"

gem "sentry-rails", "~> 5.12"
