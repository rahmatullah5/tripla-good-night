# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sleeps, dependent: :destroy
  has_many :followers, foreign_key: 'followee_id', dependent: :destroy
  has_many :followees, foreign_key: 'follower_id', class_name: 'Follower', dependent: :destroy

  validates :name, presence: true

  def sleep_durations
    sleeps.where('created_at >= ?', Time.now - 7.days).order(sleep_duration: :desc)
  end
end
