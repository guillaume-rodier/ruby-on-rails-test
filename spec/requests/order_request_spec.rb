# frozen_string_literal: true

require 'rails_helper'

shared_examples 'request_is_successful' do
  it 'returns status 200' do
    request
    expect(response.status).to eq(200)
  end
end

def create_order
  Order.create(
    reference: Faker::IDNumber.valid,
    departure_date: Faker::Date.between(from: 10.days.ago, to: Date.today),
    arrival_date: Faker::Date.between(from: Time.now, to: 10.days.from_now),
    client_name: Faker::Company.name,
    departure_city: Faker::Address.city,
    arrival_city: Faker::Address.city,
    active: Faker::Boolean.boolean
  )
end

describe 'Order requests', type: :request do
  let(:response_body) { JSON.parse(response.body) }

  describe 'active_index' do
    subject(:request) do
      get '/orders.json'
    end

    let(:response_references) { response_body.map { |o| o['reference'] } }
    let!(:order) { create_order }
    let!(:other_order) { create_order }

    it_behaves_like 'request_is_successful'

    it 'returns all orders' do
      request
      expect(response_references).to match_array([order.reference, other_order.reference])
    end
  end
end
