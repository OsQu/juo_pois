require 'sinatra'
require 'redis'

REDIS_URL = ENV.fetch("REDISTOGO_URL", "redis://localhost:6379")

VALID_CODES = %w(salaurli smartly)

get '/:code' do
  if VALID_CODES.include?(params[:code])
    @code = params[:code]
    erb :index
  else
    "Wrong url :("
  end
end

post '/record' do
  redis = Redis.new(url: REDIS_URL)
  redis.incr("kaljaa:#{params[:code]}")

  @code = params[:code]
  erb :success
end

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end
