# frozen_string_literal: true

require 'test_helper'

class SalesEventTest < ActiveSupport::TestCase
  test 'last_event_by_store_and_product should get the last event per store and model' do
    event_store_a = SalesEvent.create!(store: 'A', model: 'X', inventory: 10)
    SalesEvent.create!(store: 'B', model: 'X', inventory: 10)
    last_event_model_x = SalesEvent.create!(store: 'B', model: 'X', inventory: 20)
    event_model_y = SalesEvent.create!(store: 'B', model: 'Y', inventory: 5)

    assert_equal [event_store_a], SalesEvent.last_event_by_store_and_product('A')
    assert_equal [last_event_model_x, event_model_y].to_set, SalesEvent.last_event_by_store_and_product('B').to_set
  end
end
