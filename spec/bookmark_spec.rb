require 'bookmarks'

describe Bookmark do
  subject { Bookmark }

  describe '.all' do
    it 'returns all bookmarks' do
      expect(subject.all).to include("https://www.google.com")
    end
  end

  describe ".add" do

    it { is_expected.to respond_to(:add).with(1).argument }
    
    it "adds a bookmark to the database" do
      subject.add("fake_web_address")
      expect(subject.all).to include("fake_web_address")
    end
  end
end
