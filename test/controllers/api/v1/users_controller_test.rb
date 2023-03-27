# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user = users(:one)
      end

      test 'should get index' do
        get api_v1_users_url, as: :json
        assert_response :success

        response_json = JSON.parse(response.body)
        assert_equal User.count, response_json.length
      end

      test 'should show user' do
        get api_v1_user_url(@user), as: :json
        assert_response :success

        response_json = JSON.parse(response.body)
        assert_equal @user.id, response_json['id']
        assert_equal @user.name, response_json['name']
      end

      test 'should create user' do
        assert_difference('User.count') do
          post api_v1_users_url, params: { name: 'John Doe' }, as: :json
        end

        assert_response :created

        response_json = JSON.parse(response.body)
        assert_equal 'John Doe', response_json['name']
      end

      test 'should not create user without name' do
        assert_no_difference('User.count') do
          post api_v1_users_url, params: { name: '' }, as: :json
        end

        assert_response :unprocessable_entity

        response_json = JSON.parse(response.body)
        assert_includes response_json['name'], "can't be blank"
      end

      test 'should update user' do
        patch api_v1_user_url(@user), params: { name: 'Jane Doe' }, as: :json
        assert_response :success

        @user.reload
        assert_equal 'Jane Doe', @user.name
      end

      test 'should not update user with invalid data' do
        patch api_v1_user_url(@user), params: { name: '' }, as: :json
        assert_response :unprocessable_entity

        @user.reload
        assert_not_equal '', @user.name
      end

      test 'should destroy user' do
        assert_difference('User.count', -1) do
          delete api_v1_user_url(@user), as: :json
        end

        assert_response :no_content
      end
    end
  end
end
