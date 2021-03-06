# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'SignIns', type: :feature do
  before :each do
    User.create(name: 'User', email: 'user@example.com', password: 'user123')
  end

  scenario 'Valid User Sign in' do
    visit '/users/sign_in'
    fill_in 'Name', with: 'User'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
  end

  scenario 'Invalid User Sign in' do
    visit '/users/sign_in'
    fill_in 'Name', with: 'User'
    fill_in 'Email', with: '   '
    fill_in 'Password', with: 'user123'
    click_button 'Log in'
    expect(page).to have_text('Invalid Email or password.')
  end
end
