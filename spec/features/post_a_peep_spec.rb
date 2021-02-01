feature 'User can post a peep on Chitter' do
  scenario 'post a message' do
    visit '/new_peeps'
    fill_in :message, with: 'Hello, this is my first peep'
    click_button 'Peep'
    expect(page).to have_content('Hello, this is my first peep')
  end
end
