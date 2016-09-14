require 'sinatra'
require 'redis'

get '/' do
  erb :index
end

post '/record' do
  redis = Redis.new
  redis.incr('kaljaa')

  erb :success
end
