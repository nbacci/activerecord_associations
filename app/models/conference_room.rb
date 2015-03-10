class ConferenceRoom < ActiveRecord::Base
  has_many :reservations
  has_many :meetings, through: :reservations

  # Conference Room reservations Can see the meetings with their times for a conference room
end
