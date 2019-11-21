require 'rails_helper'

RSpec.feature "SignUps", type: :feature do

  scenario 'Valid User Sign Up' do
    visit '/users/sign_up'
    fill_in 'Name', with: 'User'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'user123'
    click_button 'Sign up'
    expect(page).to have_text('Posts')
  end

  scenario 'Invalid User Sign Up' do
    visit '/users/sign_up'
    fill_in 'Name', with: ' '
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'user123'
    click_button 'Sign up'
    expect(page).to have_text("Name can't be blank")
  end

end
