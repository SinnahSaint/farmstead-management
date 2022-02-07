require "test_helper"

class ResourceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource_type = resource_types(:one)
  end

  test "should get index" do
    get resource_types_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_type_url
    assert_response :success
  end

  test "should create resource_type" do
    assert_difference('ResourceType.count') do
      post resource_types_url, params: { resource_type: { name: @resource_type.name } }
    end

    assert_redirected_to resource_type_url(ResourceType.last)
  end

  test "should show resource_type" do
    get resource_type_url(@resource_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_type_url(@resource_type)
    assert_response :success
  end

  test "should update resource_type" do
    patch resource_type_url(@resource_type), params: { resource_type: { name: @resource_type.name } }
    assert_redirected_to resource_type_url(@resource_type)
  end

  test "should destroy resource_type" do
    assert_difference('ResourceType.count', -1) do
      delete resource_type_url(@resource_type)
    end

    assert_redirected_to resource_types_url
  end
end
