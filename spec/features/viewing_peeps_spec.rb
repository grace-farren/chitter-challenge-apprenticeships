feature 'Viewing peeps' do
  scenario 'A user can see all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('This is also a peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Along with this being a peep');")

    visit '/peeps'

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "This is also a peep"
    expect(page).to have_content "Along with this being a peep"
  end
end
