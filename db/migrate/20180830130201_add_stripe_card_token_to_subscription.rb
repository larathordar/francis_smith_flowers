class AddStripeCardTokenToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :card_token, :string
  end
end
