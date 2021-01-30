feature 'Sign up on web page' do
    scenario 'User can sign up' do
        visit ('/')
        fill_in :username, with: SalarGhotaslo
        fill_in :password, with: 'Pa55word'
        click_button 'Sign up'
        expect(page).to have_content("Thank you for signing up to Chitter SalarGhotaslo")
    end
end
