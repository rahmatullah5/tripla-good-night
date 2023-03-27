require "application_system_test_case"

class SleepsTest < ApplicationSystemTestCase
  setup do
    @sleep = sleeps(:one)
  end

  test "visiting the index" do
    visit sleeps_url
    assert_selector "h1", text: "Sleeps"
  end

  test "should create sleep" do
    visit sleeps_url
    click_on "New sleep"

    fill_in "Clock in", with: @sleep.clock_in
    fill_in "Clock out", with: @sleep.clock_out
    fill_in "User", with: @sleep.user_id
    click_on "Create Sleep"

    assert_text "Sleep was successfully created"
    click_on "Back"
  end

  test "should update Sleep" do
    visit sleep_url(@sleep)
    click_on "Edit this sleep", match: :first

    fill_in "Clock in", with: @sleep.clock_in
    fill_in "Clock out", with: @sleep.clock_out
    fill_in "User", with: @sleep.user_id
    click_on "Update Sleep"

    assert_text "Sleep was successfully updated"
    click_on "Back"
  end

  test "should destroy Sleep" do
    visit sleep_url(@sleep)
    click_on "Destroy this sleep", match: :first

    assert_text "Sleep was successfully destroyed"
  end
end
