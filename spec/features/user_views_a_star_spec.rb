require 'rails_helper'

feature "user can view a star" do
  let(:user) { FactoryGirl.create(:user) }
  let(:star) { FactoryGirl.create(:star) }

  scenario "user succesfully views a star" do
    visit star_path(star)

    expect(page).to have_content(star.star_name)
    expect(page).to have_content(star.right_ascension)
    expect(page).to have_content(star.declination)
  end
end
