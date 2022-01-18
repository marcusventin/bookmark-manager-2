require 'bookmarks'

describe Bookmark do
  describe '.all_bookmarks' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.new.all_bookmarks
      expect(bookmarks).to include("https://www.google.com")
    end
  end

  describe "#add_bookmark" do

    it { is_expected.to respond_to(:add_bookmark).with(1).argument }

    it "adds a bookmark to the database" do
      subject.add_bookmark("fake_web_address")
      expect(subject.all_bookmarks).to include("fake_web_address")
    end
  end
end
