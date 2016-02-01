require "rails_helper"

feature "user can find their star" do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:star) { FactoryGirl.create(:star) }

  scenario "user succesfully views their star" do
    sign_in_as(user)
    visit root_path
    click_on "Find Your Apex"

    expect(page).to have_content("Star successfully found!")
    expect(page).to have_content(star.star_name)
    expect(page).to have_content(star.right_ascension)
    expect(page).to have_content(star.declination)
  end

  scenario "star is successfully added to a user's collection" do
    sign_in_as(user)
    visit root_path
    click_on "Find Your Apex"
    click_on "Profile"

    expect(page).to have_content(user.username)
    expect(page).to have_content(star.star_name)
  end

  scenario "user can view past stars from their profile" do
    sign_in_as(user)
    visit root_path
    click_on "Find Your Apex"
    click_on "Profile"
    click_on star.star_name

    expect(page).to have_content(star.star_name)
    expect(page).to have_content(star.right_ascension)
    expect(page).to have_content(star.declination)
  end
end
