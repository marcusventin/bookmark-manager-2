require 'pg'

class Bookmark

  def all_bookmarks
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    result = con.exec 'SELECT * FROM bookmarks;'
    result.map { |bookmark| bookmark['url'] }

  end

  def add_bookmark(url)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    new_bookmark = con.exec "INSERT INTO bookmarks (url) VALUES('#{url}')"

  end
  
end