# frozen_string_literal: true

class SalesEvent < ApplicationRecord
  validates :store, presence: true
  validates :model, presence: true
  validates :inventory, presence: true

  after_create :notify_low_inventory

  scope :last_event_by_store_and_product, lambda { |store|
    last_events = SalesEvent
                  .where(store:)
                  .group(:model)
                  .maximum(:id)
                  .values
    where(store:)
      .where(id: last_events)
  }

  private

  def notify_low_inventory
    nil unless inventory < 5
    # send something (email, webhook, ...)
  end
end
