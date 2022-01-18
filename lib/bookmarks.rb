require 'pg'

class Bookmark

  def self.all_bookmarks

    con = PG.connect(dbname: 'bookmark_manager')
    result = con.exec 'SELECT * FROM bookmarks;'
    result.map { |bookmark| bookmark['url'] }

  end
  
end