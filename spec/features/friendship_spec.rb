# frozen_string_literal: true

require 'rails_helper'

# rubocop: disable Metrics/BlockLength
RSpec.feature 'Friendships', type: :feature do
  before :each do
    @user1 = User.create(name: 'User-1', email: 'user1@example.com', password: 'user123')
    @user2 = User.create(name: 'User-2', email: 'user2@example.com', password: 'user123')
  end

  scenario 'Request a Friend' do
    visit '/users/sign_in'
    fill_in 'Name', with: 'User-1'
    fill_in 'Email', with: 'user1@example.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'
    click_on 'Friend Requests'
    click_button 'Request Friend'
    expect(page).to have_text('Friend request sent!')
  end

  scenario 'Add a Friend' do
    @friendship = @user2.friendships.build(friend_id: @user1.id, confirmed: false)
    @friendship.save

    visit '/users/sign_in'
    fill_in 'Name', with: 'User-1'
    fill_in 'Email', with: 'user1@example.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'
    click_on 'Friend Requests'
    click_button 'Accept Friend'
    expect(page).to have_text('Friend request accepted!')
  end
end
# rubocop: enable Metrics/BlockLength
