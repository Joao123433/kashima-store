require "application_system_test_case"

class ClothingsTest < ApplicationSystemTestCase
  setup do
    @clothing = clothings(:one)
  end

  test "visiting the index" do
    visit clothings_url
    assert_selector "h1", text: "Clothings"
  end

  test "should create clothing" do
    visit clothings_url
    click_on "New clothing"

    fill_in "Description", with: @clothing.description
    fill_in "Label", with: @clothing.label
    fill_in "Path", with: @clothing.path
    fill_in "Price", with: @clothing.price
    fill_in "Quant", with: @clothing.quant
    click_on "Create Clothing"

    assert_text "Clothing was successfully created"
    click_on "Back"
  end

  test "should update Clothing" do
    visit clothing_url(@clothing)
    click_on "Edit this clothing", match: :first

    fill_in "Description", with: @clothing.description
    fill_in "Label", with: @clothing.label
    fill_in "Path", with: @clothing.path
    fill_in "Price", with: @clothing.price
    fill_in "Quant", with: @clothing.quant
    click_on "Update Clothing"

    assert_text "Clothing was successfully updated"
    click_on "Back"
  end

  test "should destroy Clothing" do
    visit clothing_url(@clothing)
    click_on "Destroy this clothing", match: :first

    assert_text "Clothing was successfully destroyed"
  end
end
