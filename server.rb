require 'sinatra'
require 'redis'

REDIS_URL = ENV.fetch("REDISTOGO_URL", "redis://localhost:6379")

get '/' do
  erb :index
end

post '/record' do
  redis = Redis.new(url: REDIS_URL)
  redis.incr('kaljaa')

  erb :success
end
