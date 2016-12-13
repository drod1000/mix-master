require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "They delete artist from show page" do
    artist = create(:artist)

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to have_content "All Artists"
    expect(page).should_not have_content "Bob Marley"
  end
end
