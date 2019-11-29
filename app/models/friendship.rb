# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true, uniqueness: { scope: :friend_id }
  validates :friend_id, presence: true
  validates :friend_id, exclusion: { in: ->(u) { [u.user_id] } }

  validate :users_are_not_already_friends

  def users_are_not_already_friends
    combinations = ["user_id = #{user_id} AND friend_id = #{friend_id} AND confirmed = true",
                    "user_id = #{friend_id} AND friend_id = #{user_id} AND confirmed = true"]
    errors.add(:user_id, 'Already friends!') if Friendship.where(combinations.join(' OR ')).exists?
  end
end