require "test_helper"

class KarticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @karticle = karticles(:one)
  end

  test "should get index" do
    get karticles_url
    assert_response :success
  end

  test "should get new" do
    get new_karticle_url
    assert_response :success
  end

  test "should create karticle" do
    assert_difference("Karticle.count") do
      post karticles_url, params: { karticle: { content: @karticle.content, kuser_id: @karticle.kuser_id } }
    end

    assert_redirected_to karticle_url(Karticle.last)
  end

  test "should show karticle" do
    get karticle_url(@karticle)
    assert_response :success
  end

  test "should get edit" do
    get edit_karticle_url(@karticle)
    assert_response :success
  end

  test "should update karticle" do
    patch karticle_url(@karticle), params: { karticle: { content: @karticle.content, kuser_id: @karticle.kuser_id } }
    assert_redirected_to karticle_url(@karticle)
  end

  test "should destroy karticle" do
    assert_difference("Karticle.count", -1) do
      delete karticle_url(@karticle)
    end

    assert_redirected_to karticles_url
  end
end
