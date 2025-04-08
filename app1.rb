require 'sinatra'
require 'sinatra/reloader'
require 'slim'

get('/') do
    @cat = {
      
    }
    slim(:index)
end