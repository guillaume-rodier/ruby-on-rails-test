# frozen_string_literal: true

class Order < ApplicationRecord
  validates :reference, presence: true, uniqueness: true
end
