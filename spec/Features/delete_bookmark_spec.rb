feature 'delete bookmark' do
  scenario 'removes bookmark from list' do
    Bookmark.add(title: 'Codwars', url: 'https://www.codewars.com/')
    Bookmark.add(title: 'Gobble', url: 'https://www.google.com/')
    Bookmark.add(title: 'Ask Jeff', url: 'https://www.askjeeves.com/')

    visit '/delete'
    fill_in 'delete_title', with: 'Codwars'
    click_button('Submit')
    expect(page).to have_link('Gobble', href: 'https://www.google.com/')
    expect(page).to have_link('Ask Jeff', href: 'https://www.askjeeves.com/')
    expect(page).not_to have_link('Codwars', href: 'https://www.codewars.com/')
  end
end
