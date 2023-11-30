require "application_system_test_case"

class SalesEventsTest < ApplicationSystemTestCase
  setup do
    @sales_event = sales_events(:one)
  end

  test "visiting the index" do
    visit sales_events_url
    assert_selector "h1", text: "Sales events"
  end

  test "should create sales event" do
    visit sales_events_url
    click_on "New sales event"

    fill_in "Inventory", with: @sales_event.inventory
    fill_in "Model", with: @sales_event.model
    fill_in "Store", with: @sales_event.store
    click_on "Create Sales event"

    assert_text "Sales event was successfully created"
    click_on "Back"
  end

  test "should update Sales event" do
    visit sales_event_url(@sales_event)
    click_on "Edit this sales event", match: :first

    fill_in "Inventory", with: @sales_event.inventory
    fill_in "Model", with: @sales_event.model
    fill_in "Store", with: @sales_event.store
    click_on "Update Sales event"

    assert_text "Sales event was successfully updated"
    click_on "Back"
  end

  test "should destroy Sales event" do
    visit sales_event_url(@sales_event)
    click_on "Destroy this sales event", match: :first

    assert_text "Sales event was successfully destroyed"
  end
end
