class SalesEvent < ApplicationRecord

  validates :store, presence: true
  validates :model, presence: true
  validates :inventory, presence: true
end
