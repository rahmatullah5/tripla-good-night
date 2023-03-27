# frozen_string_literal: true

class Sleep < ApplicationRecord
  belongs_to :user

  validates :clock_in, :clock_out, presence: true
  validates :clock_in, comparison: { less_than_or_equal_to: :clock_out }

  before_save :calculate_sleep_duration

  private

  def calculate_sleep_duration
    self.sleep_duration = clock_out - clock_in
  end
end
