require 'sinatra'
require 'sinatra/reloader'
require 'slim'

get('/') do
    @cat = {
        name: "Enzo",
        age: "6",
        fur: "fluffy",
        shape: "ripped"
    }
    slim(:index)
end