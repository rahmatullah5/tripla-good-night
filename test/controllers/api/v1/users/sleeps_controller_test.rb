# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    module Users
      class SleepsControllerTest < ActionDispatch::IntegrationTest
        setup do
          @user = users(:one)
          @sleep = sleeps(:one)
        end

        test 'should get index' do
          get api_v1_user_sleeps_url(@user), as: :json
          assert_response :success
        end

        test 'should show sleep' do
          get api_v1_user_sleep_url(@user, @sleep), as: :json
          assert_response :success
        end

        test 'should create sleep' do
          assert_difference('Sleep.count') do
            post api_v1_user_sleeps_url(@user), params: { clock_in: Time.now - 1.hour, clock_out: Time.now }, as: :json
          end

          assert_response :created
        end

        test 'should not create sleep with invalid params' do
          assert_no_difference('Sleep.count') do
            post api_v1_user_sleeps_url(@user), params: { clock_in: Time.now, clock_out: Time.now - 1.hour }, as: :json
          end

          assert_response :unprocessable_entity
        end

        test 'should update sleep' do
          patch api_v1_user_sleep_url(@user, @sleep),
                params: { clock_in: @sleep.clock_in + 1.hour, clock_out: @sleep.clock_out + 1.hour }, as: :json
          assert_response :success
        end

        test 'should not update sleep with invalid params' do
          patch api_v1_user_sleep_url(@user, @sleep), params: { clock_in: @sleep.clock_out + 1.hour }, as: :json
          assert_response :unprocessable_entity
        end

        test 'should destroy sleep' do
          assert_difference('Sleep.count', -1) do
            delete api_v1_user_sleep_url(@user, @sleep), as: :json
          end

          assert_response :no_content
        end

        private

        def sleeps_fixture_data
          { clock_in: Time.now - 1.hour, clock_out: Time.now }
        end
      end
    end
  end
end
