# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

references = %w[868-11-8107 183-83-1350 186-81-2876 200-21-7042 533-62-4770 338-07-7715 060-61-4788 003-54-0806 461-74-0701 428-66-5789]
references.each do |reference|
  Order.create(
    reference: reference,
    departure_date: Faker::Date.between(from: 10.days.ago, to: Date.today),
    arrival_date: Faker::Date.between(from: Time.now, to: 10.days.from_now),
    client_name: Faker::Company.name,
    departure_city: Faker::Address.city,
    arrival_city: Faker::Address.city,
    active: Faker::Boolean.boolean
  )
end
