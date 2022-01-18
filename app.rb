require 'sinatra/base'
require_relative 'lib/bookmarks'

class Bookmarks < Sinatra::Base
  
  get '/' do 
    redirect '/bookmarks'
  end 

  get '/bookmarks' do
   @bookmarks = Bookmark.new.all_bookmarks
   erb :'bookmarks/index'
  end

  get '/add' do
    erb :'bookmarks/add'
  end

  post '/save-bookmark' do
    Bookmark.new.add_bookmark(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end

