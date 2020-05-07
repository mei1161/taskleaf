# frozen_string_literal: true

class Task < ApplicationRecord
  has_one_attached :image
  def self.csv_attribute
    %w[name description created_at updated_at]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_association(_auth_object = nil)
    []
  end

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attribute
      all.each do |task|
        csv << csv_attribute.map { |attr| task.send(attr) }
      end
    end
  end

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
