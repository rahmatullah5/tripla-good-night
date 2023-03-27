# frozen_string_literal: true

require 'test_helper'

class SleepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sleep = sleeps(:one)
  end

  test 'should get index' do
    get sleeps_url
    assert_response :success
  end

  test 'should get new' do
    get new_sleep_url
    assert_response :success
  end

  test 'should create sleep' do
    assert_difference('Sleep.count') do
      post sleeps_url,
           params: { sleep: { clock_in: @sleep.clock_in, clock_out: @sleep.clock_out, user_id: @sleep.user_id } }
    end

    assert_redirected_to sleep_url(Sleep.last)
  end

  test 'should show sleep' do
    get sleep_url(@sleep)
    assert_response :success
  end

  test 'should get edit' do
    get edit_sleep_url(@sleep)
    assert_response :success
  end

  test 'should update sleep' do
    patch sleep_url(@sleep),
          params: { sleep: { clock_in: @sleep.clock_in, clock_out: @sleep.clock_out, user_id: @sleep.user_id } }
    assert_redirected_to sleep_url(@sleep)
  end

  test 'should destroy sleep' do
    assert_difference('Sleep.count', -1) do
      delete sleep_url(@sleep)
    end

    assert_redirected_to sleeps_url
  end
end
