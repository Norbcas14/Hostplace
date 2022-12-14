class Place < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  validates :name, :photo, :country, :address, :description, presence: true

  def country_name
    ISO3166::Country[self.country].common_name
  end
end
