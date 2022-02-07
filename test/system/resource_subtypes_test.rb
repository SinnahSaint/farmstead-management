require "application_system_test_case"

class ResourceSubtypesTest < ApplicationSystemTestCase
  setup do
    @resource_subtype = resource_subtypes(:one)
  end

  test "visiting the index" do
    visit resource_subtypes_url
    assert_selector "h1", text: "Resource Subtypes"
  end

  test "creating a Resource subtype" do
    visit resource_subtypes_url
    click_on "New Resource Subtype"

    fill_in "Name", with: @resource_subtype.name
    fill_in "Resource type", with: @resource_subtype.resource_type_id
    click_on "Create Resource subtype"

    assert_text "Resource subtype was successfully created"
    click_on "Back"
  end

  test "updating a Resource subtype" do
    visit resource_subtypes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @resource_subtype.name
    fill_in "Resource type", with: @resource_subtype.resource_type_id
    click_on "Update Resource subtype"

    assert_text "Resource subtype was successfully updated"
    click_on "Back"
  end

  test "destroying a Resource subtype" do
    visit resource_subtypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resource subtype was successfully destroyed"
  end
end
