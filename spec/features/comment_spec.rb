require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@example.com', password: 'user123')
    @post = @user.posts.build(content: 'test post', id: 1)
    @post.save
  end

  scenario 'Valid comment' do
    visit '/users/sign_in'
    fill_in 'Name', with: 'User'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'
    fill_in 'comment_content', with: 'This is my comment'
    click_button 'Comment!'
    expect(page).to have_text('Comment created!')
  end

  scenario 'Invalid comment' do
    visit '/users/sign_in'
    fill_in 'Name', with: 'User'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'user123'
    click_button 'Log in'
    fill_in 'comment_content', with: '   '
    click_button 'Comment!'
    expect(page).to have_text("Comment can't be blank")
  end
end
