require "rails_helper"

RSpec.feature "Ideas quality", type: :feature do
  scenario "User likes an existing idea", js: true do
    visit root_path

    fill_in("title", with: "Title 1")
    fill_in("body", with: "Body 1")
    click_button("Save")
    click_link("Like")

    expect(page).to_not have_content("swill")
    expect(page).to have_content("plausible")
  end
end
