require File.join(File.dirname(__FILE__), '..', 'application.rb')

require 'sinatra'
#require 'rack/test'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
Mongoid.load!(File.join(File.dirname(__FILE__), '..', 'mongoid.yml'))


def app
  Sinatra::Application
end

RSpec.configure do |config|
  #config.include Rack::Test::Methods
end