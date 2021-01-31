feature 'User can post a peep on Chitter' do
  scenario 'post a message' do
    visit '/signed_up'
    fill_in :message_box, with: 'Can you see my message?'
    click_button 'peep'
    expect(page).to have_content('Can you see my message')
  end
end
