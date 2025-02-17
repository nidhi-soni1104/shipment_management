class DeliveryPartnersController < ApplicationController
  before_action :authenticate_user!

  def index
    @shipments = Shipment.where(status: :pending)
  end

  def update_status
    @shipment = Shipment.find(params[:id])
    if @shipment.update(status: params[:status])
      redirect_to delivery_partners_path, notice: "Shipment status updated."
    else
      redirect_to delivery_partners_path, alert: "Error updating shipment status."
    end
  end
end
