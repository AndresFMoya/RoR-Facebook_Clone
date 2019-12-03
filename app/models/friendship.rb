# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true, uniqueness: { scope: :friend_id }
  validates :friend_id, presence: true
  validates :friend_id, exclusion: { in: ->(u) { [u.user_id] } }
  validate :request_are_not_already_pending

  def request_are_not_already_pending
    combination = ["user_id = #{friend_id} AND friend_id = #{user_id} AND confirmed = false"]
    errors.add(:user_id, 'You have a request pending!') if Friendship.where(combination).exists?
  end
end
