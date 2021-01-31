require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'Hello, this is my first peep');")

    visit('/view_peeps')

    expect(page).to have_content "Hello, this is my first peep"
  end
end