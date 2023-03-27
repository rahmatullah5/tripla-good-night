# frozen_string_literal: true

require 'application_system_test_case'

class FollowersTest < ApplicationSystemTestCase
  setup do
    @follower = followers(:one)
  end

  test 'visiting the index' do
    visit followers_url
    assert_selector 'h1', text: 'Followers'
  end

  test 'should create follower' do
    visit followers_url
    click_on 'New follower'

    fill_in 'Followee', with: @follower.followee_id
    fill_in 'Follower', with: @follower.follower_id
    click_on 'Create Follower'

    assert_text 'Follower was successfully created'
    click_on 'Back'
  end

  test 'should update Follower' do
    visit follower_url(@follower)
    click_on 'Edit this follower', match: :first

    fill_in 'Followee', with: @follower.followee_id
    fill_in 'Follower', with: @follower.follower_id
    click_on 'Update Follower'

    assert_text 'Follower was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Follower' do
    visit follower_url(@follower)
    click_on 'Destroy this follower', match: :first

    assert_text 'Follower was successfully destroyed'
  end
end
