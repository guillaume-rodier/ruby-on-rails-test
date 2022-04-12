# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :reference, null: false
      t.datetime :departure_date
      t.datetime :arrival_date
      t.string :client_name
      t.string :departure_city
      t.string :arrival_city
      t.boolean :active

      t.timestamps
    end

    add_index :orders, :reference, unique: true
  end
end
