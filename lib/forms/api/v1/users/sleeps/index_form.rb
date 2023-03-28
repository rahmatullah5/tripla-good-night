# frozen_string_literal: true

module Forms
  module Api
    module V1
      module Users
        module Sleeps
          class IndexForm
            include ActiveModel::Model

            attr_accessor :sort_type, :from_date, :to_date, :sort_by

            validates :from_date, presence: true,
                                  format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: 'Date must be in format yyyy-mm-dd' }
            validates :to_date, presence: true,
                                format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: 'Date must be in format yyyy-mm-dd' }
            validates :sort_by, presence: true,
                                inclusion: { in: %w[created_at sleep_duration], message: "Sort by parameter must be 'created_at' or 'sleep_duration'" }
            validates :sort_type, presence: true,
                                  inclusion: { in: %w[asc desc], message: "Sort type parameter must be 'asd' or 'desc'" }

            def initialize(attributes = {})
              super
              self.from_date ||= (DateTime.now - 1.weeks).strftime('%Y-%m-%d')
              self.to_date ||= DateTime.now.strftime('%Y-%m-%d')
              self.sort_by ||= 'created_at'
              self.sort_type ||= 'asc'
            end
          end
        end
      end
    end
  end
end
