class Reservation < ActiveRecord::Base
  belongs_to :conference_room
  belongs_to :meeting
end
