require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    p ENV
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    p params
    p 'form data submitted to the /peeps route!'
  end 


  run! if app_file == $0
end
