# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.order(:departure_date).all
    render json: @orders.to_json
  end

  def active
    @orders = Order.order(:departure_date).where("active = true")
    render json: @orders.to_json
  end

  def refresh
    require 'rest-client'

    @response = RestClient.get(
      "https://wakeo-technical-test.s3.eu-west-3.amazonaws.com/api.json"
    )

    @orders = Order.order(:departure_date).all
    @external_orders = JSON.parse(@response.body)

    @external_orders.each do |external_order|
      @local_order = Order.new(
        client_name: external_order.company,
        reference: external_order.client_number,
        departure_date: external_order.dep_time,
        arrival_date: external_order.arr_time,
        departure_city: external_order.dep_city,
        arrival_city: external_order.arr_city
      )

      if Order.exists? reference: @local_order.reference
        # Update order with id
        local_order.save
      else
        local_order.save
      end
    end

    render json: JSON.parse(@response.body)
  end
end
