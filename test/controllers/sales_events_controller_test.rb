# frozen_string_literal: true

require 'test_helper'

class SalesEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_event = sales_events(:one)
  end

  test 'should get index' do
    get sales_events_url
    assert_response :success
  end

  test 'should get new' do
    get new_sales_event_url
    assert_response :success
  end

  test 'should create sales_event' do
    assert_difference('SalesEvent.count') do
      post sales_events_url,
           params: { sales_event: { inventory: @sales_event.inventory, model: @sales_event.model,
                                    store: @sales_event.store } }
    end

    assert_redirected_to sales_event_url(SalesEvent.last)
  end

  test 'should show sales_event' do
    get sales_event_url(@sales_event)
    assert_response :success
  end

  test 'should get edit' do
    get edit_sales_event_url(@sales_event)
    assert_response :success
  end

  test 'should update sales_event' do
    patch sales_event_url(@sales_event),
          params: { sales_event: { inventory: @sales_event.inventory, model: @sales_event.model,
                                   store: @sales_event.store } }
    assert_redirected_to sales_event_url(@sales_event)
  end

  test 'should destroy sales_event' do
    assert_difference('SalesEvent.count', -1) do
      delete sales_event_url(@sales_event)
    end

    assert_redirected_to sales_events_url
  end
end
