require "application_system_test_case"

class ResourcesTest < ApplicationSystemTestCase
  setup do
    @resource = resources(:one)
  end

  test "visiting the index" do
    visit resources_url
    assert_selector "h1", text: "Resources"
  end

  test "creating a Resource" do
    visit resources_url
    click_on "New Resource"

    fill_in "Date of birth", with: @resource.date_of_birth
    fill_in "Date on farm", with: @resource.date_on_farm
    fill_in "Description", with: @resource.description
    fill_in "Name", with: @resource.name
    fill_in "Resource subtype", with: @resource.resource_subtype_id
    click_on "Create Resource"

    assert_text "Resource was successfully created"
    click_on "Back"
  end

  test "updating a Resource" do
    visit resources_url
    click_on "Edit", match: :first

    fill_in "Date of birth", with: @resource.date_of_birth
    fill_in "Date on farm", with: @resource.date_on_farm
    fill_in "Description", with: @resource.description
    fill_in "Name", with: @resource.name
    fill_in "Resource subtype", with: @resource.resource_subtype_id
    click_on "Update Resource"

    assert_text "Resource was successfully updated"
    click_on "Back"
  end

  test "destroying a Resource" do
    visit resources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resource was successfully destroyed"
  end
end
