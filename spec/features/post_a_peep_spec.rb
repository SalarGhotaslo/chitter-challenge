feature 'User can post a peep on Chitter' do
  scenario 'post a message' do
    visit '/signed_up'
    fill_in :message_box, with: 'Hello, this is my first peep'
    click_button 'peep'
    expect(page).to have_content('Hello, this is my first peep')
  end
end
