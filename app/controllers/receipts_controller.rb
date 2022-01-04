class ReceiptsController < ApplicationController
  before_action :set_receipt, only: %i[ show edit update destroy copy]

  # GET /receipts or /receipts.json
  def index
    @receipts = Receipt.all
  end

  # GET /receipts/1 or /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
    # @receipt.customer.build
  end

  # GET /receipts/1/edit
  def edit
  end

  # Create New Receipt
  def create
    @receipt = Receipt.new(receipt_params)
    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: "Receipt was successfully created." }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1 or /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: "Receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1 or /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: "Receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #Copy Receipt with all item.
  def copy
    receipt_copy = @receipt.amoeba_dup
    receipt_copy.save
    @receipt.items.destroy_all
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: "Receipt was successfully copyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_params
      params.require(:receipt).permit(:name,:cus_name,:cus_address,:cus_payment_method,:cus_order_id,:sel_name,:sel_address,:sel_vat_id,:sel_business_id,items_attributes: [:id, :name, :qty, :cost,:_destroy])
    end
end
