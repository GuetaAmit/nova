# Nova.rb

require "sinatra"
require "sinatra/json"

require_relative "Services/Users"
require_relative "Services/Storage"
require_relative "Services/Members"
require_relative "Services/Projects"


get '/?' do
    'Nova APIs mocks - UP & RUNNING :)'
end
