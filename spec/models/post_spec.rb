# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Laura', email: 'laura@example.com') }
  let(:post) { user.posts.build(content: 'test post') }

  it 'should not be blank' do
    expect(post).to be_valid
  end

  it 'should not be blank' do
    post = Post.new(content: '  ')
    expect(post).to_not be_valid
  end

  it 'should have one user' do
    post = Post.reflect_on_association(:user)
    expect(post.macro).to eq(:belongs_to)
  end
end
