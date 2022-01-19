feature 'viewing bookmarks' do
  scenario 'allows the user to see their bookmarks' do
    Bookmark.add(title: 'Codwars', url: 'https://www.codewars.com/')
    visit('/bookmarks')
    expect(page).to have_link('Codwars', href: 'https://www.codewars.com/')
  end
end
