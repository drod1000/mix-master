require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they update playlist name" do
    playlist = create(:playlist)

    visit playlist_path(playlist)
    click_on "Edit"

    fill_in "playlist_name", with: "The Best Playlist"
    click_on "Update Playlist"

    expect(page). to have_content "The Best Playlist"
  end

  scenario "they select an additional song" do
    skip
  end

  scenario "they uncheck a song" do
    skip
  end
end
