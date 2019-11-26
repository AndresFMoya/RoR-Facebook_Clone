# frozen_string_literal: true

require 'rails_helper'

# rubocop: disable Metrics/BlockLength
RSpec.feature 'Comments', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@example.com', password: 'user123')
    @post = @user.posts.build(content: 'test post', id: 1)
    @post.save
  end

  scenario 'Like a Post' do
    visit '/users/sign_in'
    fill_in 'Name', with: 'User'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'
    click_button 'Like'
    expect(page).to have_text('You like this post!')
    expect(page).to have_text('1 Like')
  end

  scenario 'Unlike a Post' do
    @like = @user.likes.build(post_id: 1)
    @like.save

    visit '/users/sign_in'
    fill_in 'Name', with: 'User'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'
    click_button 'Unlike'
    expect(page).to have_text('You unlike this post!')
    expect(page).to have_text('0 Likes')
  end
end
# rubocop: enable Metrics/BlockLength
