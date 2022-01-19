feature "viewing bookmarks" do
  scenario 'allows the user to see their bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "www.google.com"
  end
end
