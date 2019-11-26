# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Laura', email: 'laura@example.com', password: 'laura123') }

  before(:each) do
    @post = user.posts.build(content: 'test post', id: 1)
    @post.save
    @comment = user.comments.build(post_id:1, content: 'Test comment')
  end

  it 'should not be blank' do
    expect(@comment).to be_valid
  end

  it 'should not be blank' do
    comment = user.comments.build(post_id:1, content: '  ')
    expect(comment).to_not be_valid
  end

  it 'should have one user' do
    comment = Comment.reflect_on_association(:user)
    expect(comment.macro).to eq(:belongs_to)
  end

  it 'should have one post' do
    comment = Comment.reflect_on_association(:post)
    expect(comment.macro).to eq(:belongs_to)
  end
end
