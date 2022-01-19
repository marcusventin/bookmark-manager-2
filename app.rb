require 'sinatra/base'
require_relative 'lib/bookmarks'

class Bookmarks < Sinatra::Base
  
  get '/' do 
    redirect '/bookmarks'
  end 

  get '/bookmarks' do
   @bookmarks = Bookmark.all
   erb :'bookmarks/index'
  end

  get '/add' do
    erb :'bookmarks/add'
  end

  post '/save-bookmark' do
    Bookmark.add(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end

