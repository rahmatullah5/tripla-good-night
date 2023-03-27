# frozen_string_literal: true

class Sleep < ApplicationRecord
  belongs_to :user

  validates :clock_in, :clock_out, presence: true
  validates :clock_in, comparison: { less_than_or_equal_to: :clock_out }
end
