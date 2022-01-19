def truncate_db
  con = PG.connect(dbname: 'bookmark_manager_test')
  con.exec 'TRUNCATE TABLE bookmarks;'
end

def add_test_entry
  con = PG.connect(dbname: 'bookmark_manager_test')
  con.exec "INSERT INTO bookmarks (title, url) VALUES ('Codewars', 'https://www.codewars.com/');"
end
