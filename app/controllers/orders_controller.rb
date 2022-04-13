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

    # PATTERN = {
    #   "company" => "client_name",
    #   "client_number" => "reference",
    #   "dep_time" => "departure_date",
    #   "arr_time" => "arrival_date",
    #   "dep_city" => "departure_city",
    #   "arr_city" => "arrival_city"
    # }
    # https://stackoverflow.com/questions/1865116/rails-replace-attributes-in-arrays

    # @external_orders.inject({}) do |new_hash, (k, v)|
    #   key = PATTERN[k] || k
    #   new_hash[key] = v
    #   new_hash

    #   p new_hash
    # end


    # TODO: map @external_orders and create item if not exist
      # https://stackoverflow.com/questions/16682699/check-if-record-exists-from-controller-in-rails
      # 1. Loop to map @external_orders + Check
      # 2. For each items, check if exist
      # =>  Update if exist
      # 3. if not exist,
      # =>  Create


      # Ruby guide: https://guides.rubyonrails.org/getting_started.html
      # example to create:
      # article = Article.new(title: "Hello Rails", body: "I am on Rails!")

      # Logicly to create in map
      # order = Order.new(client_name: external_order["company"], reference: external_order["client_number"], ...)

    p JSON.dump(JSON.parse(@orders).merge(@external_orders))

    render json: JSON.parse(@response.body)
  end
end
