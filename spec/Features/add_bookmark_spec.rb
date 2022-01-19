feature 'Adding a new bookmark' do
  scenario 'After bookmark is added' do
    visit('/add')
    fill_in 'title', with: 'fake_title'
    fill_in 'url', with: 'fake_web_page'
    click_button('Submit')
    expect(page).to have_link('fake_title', href: 'fake_web_page')
  end
end
