# frozen_string_literal: true

require 'test_helper'

class FollowerTest < ActiveSupport::TestCase
  def setup
    @follower = users(:one)
    @followee = users(:two)
    Follower.delete_all
    @relationship = Follower.new(follower: @follower, followee: @followee)
  end

  test 'should be valid' do
    assert @relationship.valid?
  end

  test 'follower_id should be present' do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test 'followee_id should be present' do
    @relationship.followee_id = nil
    assert_not @relationship.valid?
  end

  test 'should belong to follower' do
    assert_equal @follower, @relationship.follower
  end

  test 'should belong to followee' do
    assert_equal @followee, @relationship.followee
  end

  test 'should enforce uniqueness of follower/followee relationship' do
    @relationship.save
    duplicate_relationship = Follower.new(follower: @follower, followee: @followee)
    assert_not duplicate_relationship.valid?
  end
end
