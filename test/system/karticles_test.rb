require "application_system_test_case"

class KarticlesTest < ApplicationSystemTestCase
  setup do
    @karticle = karticles(:one)
  end

  test "visiting the index" do
    visit karticles_url
    assert_selector "h1", text: "Karticles"
  end

  test "should create karticle" do
    visit karticles_url
    click_on "New karticle"

    fill_in "Content", with: @karticle.content
    fill_in "Kuser", with: @karticle.kuser_id
    click_on "Create Karticle"

    assert_text "Karticle was successfully created"
    click_on "Back"
  end

  test "should update Karticle" do
    visit karticle_url(@karticle)
    click_on "Edit this karticle", match: :first

    fill_in "Content", with: @karticle.content
    fill_in "Kuser", with: @karticle.kuser_id
    click_on "Update Karticle"

    assert_text "Karticle was successfully updated"
    click_on "Back"
  end

  test "should destroy Karticle" do
    visit karticle_url(@karticle)
    click_on "Destroy this karticle", match: :first

    assert_text "Karticle was successfully destroyed"
  end
end
