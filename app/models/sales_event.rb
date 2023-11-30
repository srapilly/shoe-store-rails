# frozen_string_literal: true

class SalesEvent < ApplicationRecord
  validates :store, presence: true
  validates :model, presence: true
  validates :inventory, presence: true

  after_create :notify_low_inventory

  private

  def notify_low_inventory
    nil unless inventory < 5
    # send something (email, webhook, ...)
  end
end
