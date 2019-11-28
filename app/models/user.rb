# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 40 }

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    friends_array += inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_array.compact
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend if !friendship.confirmed }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user if !friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |friendship| friendship.user == user }
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

  def newsfeed
    friend_ids = "SELECT friend_id FROM friendships WHERE user_id = :user_id"
    inverse_friend_ids = "SELECT user_id FROM friendships WHERE friend_id = :user_id"
    newsfeed_array = Post.where("user_id IN (#{friend_ids}) OR user_id = :user_id", user_id: id)
    newsfeed_array += Post.where("user_id IN (#{inverse_friend_ids})", user_id: id)
  end
end
