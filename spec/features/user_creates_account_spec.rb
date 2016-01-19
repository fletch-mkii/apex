require 'rails_helper'

feature "user can register for an account" do

  let(:user) { FactoryGirl.create(:user) }

  scenario "user succesfully creates a new account" do
    new_user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in 'Username', with: new_user.username
    fill_in 'Email', with: new_user.email
    fill_in 'Password', with: new_user.password
    fill_in 'Password confirmation', with: new_user.password
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario "user succesfully signs in" do
    sign_in_as(user)
    expect(page).to have_content('Signed in successfully.')
  end

  scenario "user succesfully signs out" do
    sign_in_as(user)
    click_link "Sign Out"
    expect(page).to have_content('Signed out successfully.')
  end
end
