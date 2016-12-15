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
    playlist = create(:playlist)
    song_one, song_two = create_list(:song, 2)
    playlist.songs << song_one

    visit playlist_path(playlist)
    click_on "Edit"

    check("song-#{song_two.id}")
    click_on "Update Playlist"

    expect(page).to have_content song_two.title
  end

  scenario "they uncheck a song" do
    playlist = create(:playlist)
    song_one, song_two = create_list(:song, 2)
    playlist.songs << [song_one, song_two]

    visit playlist_path(playlist)
    click_on "Edit"

    uncheck("song-#{song_one.id}")
    click_on "Update Playlist"

    expect(page).should_not have_content song_one.title
  end
end
