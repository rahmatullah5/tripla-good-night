# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sleeps, dependent: :destroy
  has_many :followers, foreign_key: 'follower_id',  dependent: :destroy
  has_many :followees, foreign_key: 'followee_id', class_name: 'Follower', dependent: :destroy
end
