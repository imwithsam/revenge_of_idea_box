require "rails_helper"

RSpec.feature "Ideas deletion", type: :feature do
  scenario "User deletes an existing idea", js: true do
    visit root_path

    fill_in("title", with: "Title 1")
    fill_in("body", with: "Body 1")
    click_button("Save")
    click_link("Delete")

    expect(page).to_not have_content("Title 1")
    expect(page).to_not have_content("Body 1")
    expect(page).to_not have_content("swill")
  end
end
