require 'bookmark'
require 'database_helpers'

describe Bookmark do
  subject { Bookmark }

  describe '.all' do
    it 'returns a list of all bookmarks' do
      PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.add(title: 'Gobble', url: 'https://www.google.com/')
      Bookmark.add(title: 'Rubby Ducks', url: 'https://ruby-doc.org/')
      Bookmark.add(title: 'Dockers', url: 'https://makers.tech/')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Gobble'
      expect(bookmarks.first.url).to eq 'https://www.google.com/'
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
      bookmark = Bookmark.add(title: 'fake_title', url: 'fake_web_address')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'fake_title'
      expect(bookmark.url).to eq 'fake_web_address'
    end
  end

  describe '.delete' do
    it 'removes a bookmark from the database' do
      Bookmark.add(title: 'first_dummy', url: 'first_dummy_url')
      Bookmark.add(title: 'fake_title', url: 'fake_web_address')
      Bookmark.delete('fake_title')
      bookmark = Bookmark.all
      expect(bookmark.last.title).not_to eq 'fake_title'
    end
  end
end
