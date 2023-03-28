# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    module Users
      class FollowersControllerTest < ActionDispatch::IntegrationTest
        setup do
          @user = users(:one)
          @follower = followers(:one)
        end

        test 'should get index' do
          get api_v1_user_followers_url(@user), as: :json
          assert_response :success
        end

        test 'should get show' do
          get api_v1_user_follower_url(@user, @follower), as: :json
          assert_response :success
        end

        test 'should create follower' do
          followeer = User.create(name: 'John Doe')
          assert_difference('@user.followers.count') do
            post api_v1_user_followers_url(@user), params: { follower_id: followeer.id }, as: :json
          end

          assert_response :created
        end

        test 'should not create follower with invalid params' do
          assert_no_difference('Follower.count') do
            post api_v1_user_followers_url(@user), params: { follower_id: nil }, as: :json
          end

          assert_no_difference('Follower.count') do
            post api_v1_user_followers_url(@user), params: { follower_id: @follower.follower }, as: :json
          end
          assert_response :unprocessable_entity
        end

        test 'should destroy follower' do
          assert_difference('Follower.count', -1) do
            delete api_v1_user_follower_url(@user, @follower), as: :json
          end

          assert_response :no_content
        end
      end
    end
  end
end
