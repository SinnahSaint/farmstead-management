require "test_helper"

class ResourceSubtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource_subtype = resource_subtypes(:one)
  end

  test "should get index" do
    get resource_subtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_subtype_url
    assert_response :success
  end

  test "should create resource_subtype" do
    assert_difference('ResourceSubtype.count') do
      post resource_subtypes_url, params: { resource_subtype: { name: @resource_subtype.name, resource_type_id: @resource_subtype.resource_type_id } }
    end

    assert_redirected_to resource_subtype_url(ResourceSubtype.last)
  end

  test "should show resource_subtype" do
    get resource_subtype_url(@resource_subtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_subtype_url(@resource_subtype)
    assert_response :success
  end

  test "should update resource_subtype" do
    patch resource_subtype_url(@resource_subtype), params: { resource_subtype: { name: @resource_subtype.name, resource_type_id: @resource_subtype.resource_type_id } }
    assert_redirected_to resource_subtype_url(@resource_subtype)
  end

  test "should destroy resource_subtype" do
    assert_difference('ResourceSubtype.count', -1) do
      delete resource_subtype_url(@resource_subtype)
    end

    assert_redirected_to resource_subtypes_url
  end
end
