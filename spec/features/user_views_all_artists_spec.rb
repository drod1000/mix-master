require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they can see all names" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  Artist.create(name: artist_name, image_path: artist_image_path)

  visit artists_path
  expect(page).to have_content artist_name

  end
  scenario "each name links to their page" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: artist_name, image_path: artist_image_path)
    visit artists_path
    click_on "Bob Marley"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
