# frozen_string_literal: true

class StoreController < ApplicationController
  def show
    @store = params[:id]

    @sales_events = SalesEvent.last_event_by_store_and_product(@store)
                              .order(inventory: :asc)
  end
end
