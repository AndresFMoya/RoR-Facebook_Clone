# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Laura', email: 'laura@example.com', password: 'laura123') }

  before(:each) do
    @post = user.posts.build(content: 'test post', id: 1)
    @post.save
  end

  it 'should have one user' do
    like = Like.reflect_on_association(:user)
    expect(like.macro).to eq(:belongs_to)
  end

  it 'should have one post' do
    like = Like.reflect_on_association(:post)
    expect(like.macro).to eq(:belongs_to)
  end
end
