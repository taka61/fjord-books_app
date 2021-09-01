# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relationships,
           class_name: 'Relationship',
           foreign_key: 'follower_id',
           dependent: :destroy,
           inverse_of: :follower

  has_many :passive_relationships,
           class_name: 'Relationship',
           foreign_key: 'following_id',
           dependent: :destroy,
           inverse_of: :following

  has_many :followings, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(user_id)
    active_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    active_relationships.find_by(following_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
