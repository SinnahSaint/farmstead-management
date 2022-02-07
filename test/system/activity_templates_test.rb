require "application_system_test_case"

class ActivityTemplatesTest < ApplicationSystemTestCase
  setup do
    @activity_template = activity_templates(:one)
  end

  test "visiting the index" do
    visit activity_templates_url
    assert_selector "h1", text: "Activity Templates"
  end

  test "creating a Activity template" do
    visit activity_templates_url
    click_on "New Activity Template"

    fill_in "Default values", with: @activity_template.default_values
    fill_in "Description", with: @activity_template.description
    fill_in "Name", with: @activity_template.name
    fill_in "Resource subtype", with: @activity_template.resource_subtype_id
    fill_in "Yield", with: @activity_template.yield
    click_on "Create Activity template"

    assert_text "Activity template was successfully created"
    click_on "Back"
  end

  test "updating a Activity template" do
    visit activity_templates_url
    click_on "Edit", match: :first

    fill_in "Default values", with: @activity_template.default_values
    fill_in "Description", with: @activity_template.description
    fill_in "Name", with: @activity_template.name
    fill_in "Resource subtype", with: @activity_template.resource_subtype_id
    fill_in "Yield", with: @activity_template.yield
    click_on "Update Activity template"

    assert_text "Activity template was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity template" do
    visit activity_templates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity template was successfully destroyed"
  end
end
