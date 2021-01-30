require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    erb(:index)
  end

  post '/enter_user_info' do
    session[:username_login] = params[:username]
    redirect '/signed_up'
  end

  get '/signed_up' do
    @username = session[:username_login]
    erb(:signed_up)
  end

  post '/peeps' do
   session[:peep] = params[:message_box]
   redirect '/chitter'
  end

  get '/chitter' do
    @message_box = session[:peep]
    erb(:chitter)
  end

  run! if app_file == $0
end
