feature 'adding a new peep' do
  scenario ' A user can add a peep to chitter' do
    visit '/peeps/new'
    fill_in("message", with: 'This is a new peep')
    click_button('Peep')

    expect(page).to have_content 'This is a new peep'
  end
end
