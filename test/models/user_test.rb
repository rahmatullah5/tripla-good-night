# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'should have many sleeps' do
    assert_difference('@user.sleeps.count', 2) do
      @user.sleeps.create(clock_in: Time.now, clock_out: Time.now + 8.hours)
      @user.sleeps.create(clock_in: Time.now + 1.day, clock_out: Time.now + 1.day + 8.hours)
    end

    assert_equal @user.sleeps.count, @user.sleep_durations.count
  end

  test 'should have many followers' do
    follower = User.create(name: 'John Doe')
    assert_difference('@user.followers.count') do
      @user.followers.create!(follower:)
    end
  end

  test 'should have many followees' do
    followee = User.create(name: 'Jane Doe')
    assert_difference('@user.followees.count') do
      @user.followees.create!(followee:)
    end
  end
end
