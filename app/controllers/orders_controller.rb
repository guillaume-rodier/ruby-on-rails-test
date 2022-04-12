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

    @external_orders = JSON.parse(@response.body)

    render json: @external_orders
  end
end
