feature "looks at the index.erb and view the content" do 
  scenario 'allow the user to go on the index page' do 
    visit('/')
    expect(page).to have_content "Here are your bookmarks" 
  end
end
