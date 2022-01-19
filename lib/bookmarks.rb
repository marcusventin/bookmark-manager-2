require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    result = con.exec 'SELECT * FROM bookmarks;'
    result.map { |bookmark| bookmark['url'] }

  end

  def self.add(url)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    new_bookmark = con.exec "INSERT INTO bookmarks (url) VALUES('#{url}')"

  end
  
end