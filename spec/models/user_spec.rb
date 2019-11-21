# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Laura', email: 'laura@example.com', password: 'laura123') }

  it 'should have a name present' do
    expect(user).to be_valid
  end

  it 'should have a name present' do
    user = User.new(name: '  ')
    expect(user).to_not be_valid
  end

  it 'should have a email present' do
    user = User.new(email: '  ')
    expect(user).to_not be_valid
  end

  it 'should have a name less than 20 characters long' do
    user = User.new(name: 'SuperCalifragilisticlyNamed')
    expect(user).to_not be_valid
  end

  it 'should have an email less than 40 characters long' do
    user = User.new(email: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@example.com')
    expect(user).to_not be_valid
  end

  it 'should have many posts' do
    user = User.reflect_on_association(:posts)
    expect(user.macro).to eq(:has_many)
  end
end
