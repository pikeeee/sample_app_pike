source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.10'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.6'
# Use sqlite3 as the database for Active Record
gem 'puma', '3.12.2'
gem 'bcrypt', '3.1.13'

gem 'sass-rails'
gem 'bootstrap-sass', '3.4.1'
gem 'webpacker', '4.0.7'
gem 'turbolinks', '5.2.0'
gem 'jbuilder', '2.9.1'
gem 'bootsnap', '1.4.5', require: false
group :development, :test do

gem 'byebug', '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
gem 'web-console'
gem 'listen'
gem 'spring'
gem 'sqlite3', '1.4.1'
gem 'spring-watcher-listen'
end
group :test do
gem 'capybara', '3.28.0'
gem 'selenium-webdriver'
gem 'webdrivers', '4.1.2'
gem 'rails-controller-testing', '1.0.4'
gem 'minitest'
gem 'minitest-reporters'
gem 'guard', '2.15.0'
gem 'guard-minitest'
end
group :production do
gem 'pg', '1.1.4'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
