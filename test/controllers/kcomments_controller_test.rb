require "test_helper"

class KcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kcomment = kcomments(:one)
  end

  test "should get index" do
    get kcomments_url
    assert_response :success
  end

  test "should get new" do
    get new_kcomment_url
    assert_response :success
  end

  test "should create kcomment" do
    assert_difference("Kcomment.count") do
      post kcomments_url, params: { kcomment: { content: @kcomment.content, karticle_id: @kcomment.karticle_id, kuser_id: @kcomment.kuser_id } }
    end

    assert_redirected_to kcomment_url(Kcomment.last)
  end

  test "should show kcomment" do
    get kcomment_url(@kcomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_kcomment_url(@kcomment)
    assert_response :success
  end

  test "should update kcomment" do
    patch kcomment_url(@kcomment), params: { kcomment: { content: @kcomment.content, karticle_id: @kcomment.karticle_id, kuser_id: @kcomment.kuser_id } }
    assert_redirected_to kcomment_url(@kcomment)
  end

  test "should destroy kcomment" do
    assert_difference("Kcomment.count", -1) do
      delete kcomment_url(@kcomment)
    end

    assert_redirected_to kcomments_url
  end
end
