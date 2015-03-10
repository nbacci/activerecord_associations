require 'spec_helper'

feature "Conference Room reservations" do
  scenario "Can see the meetings with their times for a conference room" do
    conference_room = ConferenceRoom.create!(name: "Boulder West")
    ipm = Meeting.create!(name: "gSchool IPM")
    book_club = Meeting.create!(name: "Book Club")

    ipm_reservation_time = 2.days.from_now
    Reservation.create!(conference_room_id: conference_room.id, meeting_id: ipm.id, starts_at: ipm_reservation_time)

    book_club_reservation_time = 7.days.from_now
    Reservation.create!(conference_room_id: conference_room.id, meeting_id: book_club.id, starts_at: book_club_reservation_time)

    visit conference_room_path(conference_room)

    within(".reservations") do
      expect(page).to have_content ipm_reservation_time.strftime("%F")
      expect(page).to have_content book_club_reservation_time.strftime("%F")
    end

    within(".meetings") do
      expect(page).to have_content "gSchool IPM"
      expect(page).to have_content "Book Club"
    end
  end
end
