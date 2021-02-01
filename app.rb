require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    erb(:index)
  end

  get '/new_peeps' do
    erb(:new_peeps)
  end
#   post '/view_peeps'do
#   peep = params['peep']
#   connection = PG.connect(dbname: 'chitter_test')
#   connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
#   redirect '/view_peeps'
# end

  post "/view_peeps" do
    Peep.create(peep: params[:peep])
    redirect('/view_peeps')
  end

  get '/view_peeps' do
    @peeps = Peep.all
    erb(:view_peeps)
  end
  run! if app_file == $0

end


#   post '/enter_user_info' do
#     session[:username_login] = params[:username]
#     redirect '/signed_up'
#   end

#   get '/signed_up' do
#     @username = session[:username_login]
#     erb(:signed_up)
#   end

#   post '/peeps' do
#    session[:peep] = params[:message_box]
#   redirect "/chitter"
#   end

#   get '/chitter' do
#     @message_box = session[:peep]
#     # @Peep = Peep.all
#     erb(:chitter)
#   end

#   run! if app_file == $0
# end
