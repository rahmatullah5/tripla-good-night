# frozen_string_literal: true

class AddSleepDurationToSleep < ActiveRecord::Migration[7.0]
  def change
    add_column :sleeps, :sleep_duration, :integer, default: 0
  end
end
