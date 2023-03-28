# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test 'visiting the index' do
    visit users_url

    assert_selector 'h1', text: 'Users'

    click_on 'Show', match: :first

    click_on 'Back to users'
  end

  test 'visiting the show' do
    visit user_url(@user)

    assert_selector 'h1', text: 'User Detail'

    assert_selector 'h1', text: 'Clock In/Clock Out Records'

    assert_selector 'h1', text: 'Sleep Duration Records'

    assert_selector 'h1', text: 'Followers'

    assert_selector 'h1', text: 'Followees'
  end
end
