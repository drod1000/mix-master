require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they update info from show page" do
    artist = create(:artist)

    visit artist_path(artist)
    click_on "Edit"

    fill_in "artist_name", with: "BOB MARLEY"
    click_on "Update Artist"

    expect(page).to have_content "BOB MARLEY"
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end

end
