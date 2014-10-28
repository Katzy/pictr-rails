require 'features/helper'

feature "Image Upload Spec" do
  let (:user_hash) { fixtures::Users[:registered] }
  let (:user) { User.create(:user_hash) }
  scenario "A logged in user may upload a picture" do
    login_a(user)

    visit root_path
    click_link_or_button "upload_picture"

    attach_file "picture_picture", Fixtures.image_path("doggie.jpg")

    fill_in "picture_caption", with: "Awesome pic!"
    fill_in "picture_description", with: "This is the pic's description"

    click_link_or_button "commit"
  end
end