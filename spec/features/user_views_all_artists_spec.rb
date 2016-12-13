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
    click_on "Bob Marley"
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
