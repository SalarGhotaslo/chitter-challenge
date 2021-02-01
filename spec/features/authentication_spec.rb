feature 'authentication' do
    it 'a user can sign in' do
      # Create a Salar user
      User.create('Salar Ghotaslo', 'SGhotaslo', 'Salar@example.com', 'pa55word')
  
      # Then sign in as them
      visit '/sessions/new'
      fill_in(:email, with: 'Salar@example.com')
      fill_in(:password, with: 'pa55word')
      click_button('Sign in')
  
      expect(page).to have_content 'Hello, Salar Ghotaslo'
    end
  
    scenario 'a user sees an error if they get their email wrong' do
      User.create('Salar Ghotaslo', 'SGhotaslo', 'Salar@example.com', 'pa55word')
  
      visit '/sessions/new'
      fill_in(:email, with: 'Salar@me.com')
      fill_in(:password, with: 'pa55word')
      click_button('Sign in')
  
      expect(page).not_to have_content 'Welcome, Salar@example.com'
      expect(page).to have_content 'Please check your email or password.'
    end
  
    scenario 'a user sees an error if they get their password wrong' do
      User.create('Salar Ghotaslo', 'SGhotaslo', 'Salar@example.com', 'pa55word')
  
     visit '/sessions/new'
     fill_in(:email, with: 'Salar@example.com')
     fill_in(:password, with: 'randompassword')
     click_button('Sign in')
  
     expect(page).not_to have_content 'Welcome, Salar@example.com'
     expect(page).to have_content 'Please check your email or password.'
   end
  
   scenario 'a user can sign out' do
    User.create('Salar Ghotaslo', 'SGhotaslo', 'Salar@example.com', 'pa55word')
  
    visit '/sessions/new'
    fill_in(:email, with: 'Salar@example.com')
    fill_in(:password, with: 'randompassword')
    click_button('Sign in')
  
    # Sign out
    click_button('Sign out')
  
    expect(page).not_to have_content 'Welcome, Salar@example.com'
    expect(page).to have_content 'You have signed out.'
   end
  end