require 'sinatra/base'

class Bookmarks < Sinatra::Base
  
  get '/' do 
    "hello world"
  end 


  run! if app_file == $0

end