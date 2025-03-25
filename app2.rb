require 'sinatra' 
require 'sinatra/reloader'

get('/bet/:stake/on/:number') do
    stake = 1000

    number = 


    roll = rand(6) + 1

    if number == roll
        #berätta hur mkt man vinner
    else
        #berätta hur mkt man förlorar
    end
end
