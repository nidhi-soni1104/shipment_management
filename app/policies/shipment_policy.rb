class ShipmentPolicy < ApplicationPolicy
  def create?
    user.customer?
  end

  def update?
    user.delivery_partner?
  end

  def assign?
    user.admin?
  end
end
