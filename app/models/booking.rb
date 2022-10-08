class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates_presence_of :start_date, :end_date, :user_id, :place_id
  validates_uniqueness_of :place_id, scope: %i[start_date end_date]
end
