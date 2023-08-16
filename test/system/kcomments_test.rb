require "application_system_test_case"

class KcommentsTest < ApplicationSystemTestCase
  setup do
    @kcomment = kcomments(:one)
  end

  test "visiting the index" do
    visit kcomments_url
    assert_selector "h1", text: "Kcomments"
  end

  test "should create kcomment" do
    visit kcomments_url
    click_on "New kcomment"

    fill_in "Content", with: @kcomment.content
    fill_in "Karticle", with: @kcomment.karticle_id
    fill_in "Kuser", with: @kcomment.kuser_id
    click_on "Create Kcomment"

    assert_text "Kcomment was successfully created"
    click_on "Back"
  end

  test "should update Kcomment" do
    visit kcomment_url(@kcomment)
    click_on "Edit this kcomment", match: :first

    fill_in "Content", with: @kcomment.content
    fill_in "Karticle", with: @kcomment.karticle_id
    fill_in "Kuser", with: @kcomment.kuser_id
    click_on "Update Kcomment"

    assert_text "Kcomment was successfully updated"
    click_on "Back"
  end

  test "should destroy Kcomment" do
    visit kcomment_url(@kcomment)
    click_on "Destroy this kcomment", match: :first

    assert_text "Kcomment was successfully destroyed"
  end
end
