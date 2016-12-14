require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they can see links to all playlists" do
    playlist = create(:playlist)

    visit playlists_path
    expect(page). to have_link playlist.name, href: playlist_path(playlist)
  end
end
