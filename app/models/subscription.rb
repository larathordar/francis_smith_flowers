class Subscription < ApplicationRecord
  validates :name, :address, :postcode, :mobile_number, :frequency, :size, :delivery, :start, presence: true
  # validates :mobile_number, numericality: {only_integer: true }, length: { minimum: 10, too_short: "is too short "}

  FREQUENCY = %w{ Weekly Fortnightly Monthly}
  SIZE = %w{ Small Medium Large Sublime}
  DELIVERY = %w{ Thursday-Delivery Friday-Delivery Friday-AM-Collection, Friday-PM-Collection}

  def process_payment
    customer = Stripe::Customer.create card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: 500,
                          description: "flowers",
                          currency: 'gbp'
end
end
