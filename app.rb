require 'sinatra/base'
require_relative './lib/bookmark'

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
    Bookmark.add(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/delete' do
    erb :'bookmarks/delete'
  end

  post '/delete-bookmark' do
    Bookmark.delete(params[:delete_title])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
