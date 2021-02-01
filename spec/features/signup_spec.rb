feature 'Sign up on web page' do
  scenario 'User can sign up' do
    visit '/'
 click_button('Sign up')

fill_in('name', with: 'Salar Ghotaslo')
fill_in('username', with: 'SGhotaslo')
fill_in('email', with: 'Salar@example.com')
fill_in('password', with: 'Pa55word')
click_button('Create account')

expect(page).to have_content "Thanks for signing up to Chitter Salar Ghotaslo"
end
end