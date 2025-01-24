source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.6'

gem 'bootsnap',        '1.16.0', require: false
gem 'bootstrap-sass',  '3.4.1'
gem 'importmap-rails', '1.1.5'
gem 'jbuilder',        '2.11.5'
gem 'puma',            '5.6.8'
gem 'rails',           '7.0.4.3'
gem 'sassc-rails',     '2.1.2'
gem 'sprockets-rails', '3.4.2'
gem 'sqlite3',         '1.6.1'
gem 'stimulus-rails',  '1.2.1'
gem 'turbo-rails',     '1.4.0'

group :development, :test do
  gem 'debug', '1.7.1', platforms: %i[mri mingw x64_mingw]
  gem 'reline', '0.5.10'
end

group :development do
  gem 'irb',                 '1.10.0'
  gem 'repl_type_completor', '0.1.2'
  gem 'solargraph',          '0.50.0'
  gem 'web-console',         '4.2.0'
end

group :test do
  gem 'capybara',                 '3.38.0'
  gem 'guard',                    '2.18.0'
  gem 'rails-controller-testing', '1.0.5'
  gem 'selenium-webdriver',       '4.8.3'
  gem 'webdrivers',               '5.2.0'
  # RSpec
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end
