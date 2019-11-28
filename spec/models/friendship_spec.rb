require "rails_helper"

RSpec.describe Friendship, type: :model do
  let(:user) { User.new(name: "Laura", email: "laura@example.com", password: "laura123") }
  let(:friend) { User.new(name: "Marsha", email: "marsha@example.com", password: "marsha123") }

  it "should have one user" do
    friendship = Friendship.reflect_on_association(:user)
    expect(friendship.macro).to eq(:belongs_to)
  end

  it "should have one friend" do
    friendship = Friendship.reflect_on_association(:friend)
    expect(friendship.macro).to eq(:belongs_to)
  end
end
