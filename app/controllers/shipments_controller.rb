class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update]

  def index
    @shipments = current_user.customer.shipments
  end

  def new
    @shipment = current_user.customer.shipments.new
  end

  def create
    @shipment = current_user.customer.shipments.new(shipment_params)
    if @shipment.save
      redirect_to shipments_path, notice: "Shipment created successfully!"
    else
      render :new
    end
  end

  def show; end

  def assigned_shipments
	  @shipments = current_user.delivery_partner.shipments
  end

	def update
	  if @shipment.update(status: params[:status])
	    redirect_to assigned_shipments_shipments_path, notice: "Status updated!"
	  else
	    render :edit
	  end
	end


  private

  def set_shipment
    @shipment = Shipment.find(params[:id])
  end

  def shipment_params
    params.require(:shipment).permit(:source, :target)
  end
end
