class Receipt < ApplicationRecord
    has_many :items, inverse_of: :receipt, :dependent => :destroy
    has_one :customer , :dependent => :destroy
    has_one :seller, :dependent => :destroy
    accepts_nested_attributes_for :items,allow_destroy: true,reject_if: :all_blank
    attr_accessor :cus_name,:cus_address,:cus_order_id,:cus_payment_method #customer
    attr_accessor :sel_name,:sel_address,:sel_vat_id,:sel_business_id #seller
    after_commit :save_details, on: [:create, :update]
    amoeba do
        enable
      end

      #save customer and seller after create receipt
      def save_details
        Customer.create name: cus_name,address: cus_address , payment_method: cus_payment_method,order_id: cus_order_id,receipt: self
        Seller.create name: cus_name,address: cus_address , vat_id: sel_vat_id,business_id: sel_business_id,receipt: self
      end
end
