require "test_helper"

class ActivityTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_template = activity_templates(:one)
  end

  test "should get index" do
    get activity_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_template_url
    assert_response :success
  end

  test "should create activity_template" do
    assert_difference('ActivityTemplate.count') do
      post activity_templates_url, params: { activity_template: { default_values: @activity_template.default_values, description: @activity_template.description, name: @activity_template.name, resource_subtype_id: @activity_template.resource_subtype_id, yield: @activity_template.yield } }
    end

    assert_redirected_to activity_template_url(ActivityTemplate.last)
  end

  test "should show activity_template" do
    get activity_template_url(@activity_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_template_url(@activity_template)
    assert_response :success
  end

  test "should update activity_template" do
    patch activity_template_url(@activity_template), params: { activity_template: { default_values: @activity_template.default_values, description: @activity_template.description, name: @activity_template.name, resource_subtype_id: @activity_template.resource_subtype_id, yield: @activity_template.yield } }
    assert_redirected_to activity_template_url(@activity_template)
  end

  test "should destroy activity_template" do
    assert_difference('ActivityTemplate.count', -1) do
      delete activity_template_url(@activity_template)
    end

    assert_redirected_to activity_templates_url
  end
end
