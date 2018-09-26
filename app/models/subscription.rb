class Subscription < ApplicationRecord
  validates :name, :address, :postcode, :mobile_number, :frequency, :size, :delivery, :start, presence: true
  # validates :mobile_number, numericality: {only_integer: true }, length: { minimum: 10, too_short: "is too short "}

  FREQUENCY = [['Weekly', 'week'], ['Fortnightly', '2 weeks'], ['Monthly', 'month']]
  SIZE = [['small', 3000], ['medium',5000], ["Large",8000], ["sublime", 11000]]
  DELIVERY = ['Thursday Delivery', 'Friday Delivery', 'Friday AM Collection', 'Friday PM collection']




  def process_payment
  customer_data = { card: card_token, plan: plan.sku}
  customer = Stripe::Customer.create customer_data

  Stripe::Charge.create customer: customer.id,
                        amount: @plan.price * 100,
                        description: plan.name,
                        currency: 'gbp'

end

  end
