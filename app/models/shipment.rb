class Shipment < ApplicationRecord
  belongs_to :customer
  belongs_to :delivery_partner, optional: true

  enum status: { pending: "pending", assigned: "assigned", in_transit: "in_transit", delivered: "delivered" }

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= "pending"
  end
end
