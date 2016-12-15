require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they can see all names" do
    artist = create(:artist)

    visit artists_path
    expect(page).to have_content artist.name

  end
  scenario "each name links to their page" do
    artist = create(:artist)

    visit artists_path

    expect(page). to have_link artist.name, href: artist_path(artist)
  end
end
