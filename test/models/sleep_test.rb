# frozen_string_literal: true

require 'test_helper'

class SleepTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @sleep = @user.sleeps.build(clock_in: Time.now, clock_out: Time.now + 8.hours)
  end

  test 'should be valid' do
    assert @sleep.valid?
  end

  test 'clock_in should be present' do
    @sleep.clock_in = nil
    assert_not @sleep.valid?
  end

  test 'clock_out should be present' do
    @sleep.clock_out = nil
    assert_not @sleep.valid?
  end

  test 'clock_in should be less than clock_out' do
    @sleep.clock_in = Time.now + 8.hours
    @sleep.clock_out = Time.now
    assert_not @sleep.valid?
  end

  test 'should belong to user' do
    assert_equal @user, @sleep.user
  end
end
