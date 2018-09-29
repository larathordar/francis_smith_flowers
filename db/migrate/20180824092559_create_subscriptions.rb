class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :mobile_number
      t.string :deliverAddress
      t.string :deliverName
      t.string :deliverNumber
      t.string :frequency
      t.string :size
      t.string :delivery
      t.date :start

      t.timestamps
    end
  end
end
