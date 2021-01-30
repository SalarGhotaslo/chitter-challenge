require 'sinatra/base'

class Chitter < Sinatra::Base
    enable :sessions
  get '/' do
    'Hello World'
    erb(:index)
  end

  post '/signup' do
    session[:username_login] = params[:username]
   redirect '/logged_in'
  end

  get '/logged_in' do
    @username = session[:username_login]
    erb(:logged_in)
  end
  run! if app_file == $0
end