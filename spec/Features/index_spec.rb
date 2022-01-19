feature 'looks at the index.erb and view the content' do
  scenario 'allows the user to go on the index page' do
    visit('/')
    expect(page).to have_content 'Here are your bookmarks'
  end
end
